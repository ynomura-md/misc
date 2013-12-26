use strict;
use warnings;
use Crypt::ECB;
use Crypt::DES_EDE3;
use MIME::Base64::URLSafe;

# usage
# carton install
# perl -I local/lib/perl5/ decoder.pl "KEY" "URL SAFE BASE64 ENCODED TEXT"

my $key = $ARGV[0];
my $encoded_text = $ARGV[1];

my $decoded = urlsafe_b64decode($encoded_text);

print "decode url safe base64:", $decoded, "\n";
my $cipher = Crypt::ECB->new;
$cipher->key($key);
$cipher->padding(PADDING_AUTO);
$cipher->cipher('DES_EDE3');
print "decode:", $cipher->decrypt(pack('H*', $decoded)), "\n";
