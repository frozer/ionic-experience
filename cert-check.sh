#!/bin/bash
# based on https://developer.apple.com/forums/thread/25466
#
PWD=`pwd`
TIMESTAMP=`date +%s`
HELP="Signing certificate check utility.\nUsage: cert-check.sh <PATH-TO-IPA>\n"
TMP="/tmp/cert-check.${TIMESTAMP}"
IPA=$1
UNZIP=`which unzip`
CODESIGN=`which codesign`
OPENSSL=`which openssl`

[ -z $IPA ] && { echo "ERROR: No IPA defined.\n${HELP}"; exit 1 }
[ -z $UNZIP ] && { echo "ERROR: No Unzip found.\n"; exit 1 }
[ -z $CODESIGN ] && { echo "ERROR: No Codesign found.\n"; exit 1 }
[ -z $OPENSSL ] && { echo "ERROR: No OpenSSL found.\n"; exit 1 }

rm -rf $TMP
mkdir $TMP
[ ! -d $TMP ] && { echo "ERROR: Unable to create temp dir ${TMP}\n"; exit 1 }

$UNZIP -q $IPA -d "$TMP/"
cd $TMP

$CODESIGN -d --extract-certificates Payload/*.app

$OPENSSL x509 -inform DER -in codesign0 -out codesign0.pem
[ -f codesign0.pem ] && { echo "ERROR: Unable to extract 0.pem.\n"; exit 1 }

$OPENSSL x509 -inform DER -in codesign1 -out codesign1.pem
[ -f codesign0.pem ] && { echo "ERROR: Unable to extract 1.pem.\n"; exit 1 }

$OPENSSL x509 -inform DER -in codesign2 -out codesign2.pem
[ -f codesign0.pem ] && { echo "ERROR: Unable to extract 2.pem.\n"; exit 1 }

cat codesign1.pem codesign2.pem > cachain.pem

$OPENSSL x509 -inform DER -in codesign0 -noout -nameopt -oneline -subject -serial -dates

cd $PWD
rm -rf $TMP
