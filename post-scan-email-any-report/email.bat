@echo off
REM Customize cx_install_path to match your installation
SET cx_install_path="C:\Program Files\Checkmarx"

REM The purpose of this script is to allow email distribution lists to be configured
REM in the post-scan action definition rather than in the post-scan action script itself.
REM It also allows any of the result types generated by the post-scan action to be
REM attached to the email.

REM There are two arguments to this batch file in the Post-Scan action config:
REM 1. A comma-separated list of email addresses
REM 2. The attachment type (e.g. [PDF_output])
REM
REM Any attachment type is supported.  No other arguments are supported.
REM
REM To properly handle spaces in paths and special character in email addresses, the arguments of the
REM post scan action are formated as such:
REM
REM Url encoded (the [PDF_Output] part and semi-colons are not encoded):
REM %22person1%2Babc@gmail.com,person2@checkmarx.com%22,%22;[PDF_output];%22
REM Which decoded translates to:
REM "person1+abc@gmail.com,person2@checkmarx.com","(PDF path)"
REM
REM If there are no special chars needed (e.g. the '+' in the email address, non-ASCII chars in adressee names, etc)
REM then this format is also supported:
REM 'person1@gmail.com,person2@checkmarx.com',';[PDF_output];'
REM Which translates to:
REM 'person1@gmail.com,person2@checkmarx.com','(PDF path)'
REM
REM Assuming the SMTP parameters in the .ps1 file have been properly configured, the email
REM should be sent to the distribution list with the attachment.

powershell.exe -ExecutionPolicy Bypass -File %cx_install_path%\Executables\email.ps1 -cmd "%*"
