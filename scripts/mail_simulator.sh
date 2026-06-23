#!/bin/bash

RECIPIENT="admin@university.local"
SUBJECT="$1"
MESSAGE="$2"

MAIL_LOG="./logs/mail.log"

mkdir -p ./logs

echo "==================================" >> "$MAIL_LOG"
echo "Date: $(date)" >> "$MAIL_LOG"
echo "To: $RECIPIENT" >> "$MAIL_LOG"
echo "Subject: $SUBJECT" >> "$MAIL_LOG"
echo "" >> "$MAIL_LOG"
echo "$MESSAGE" >> "$MAIL_LOG"
echo "" >> "$MAIL_LOG"
