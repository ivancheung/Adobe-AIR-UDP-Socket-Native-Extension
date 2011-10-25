echo Replace SDK_PATH and ANE_PATH and CERTIFICATES_FILE and PROVISIONING_PROFILE before running
pause

"D:\downloads\flex_sdk_4.5.1\bin\adt.bat" -package -target ipa-ad-hoc -storetype pkcs12 -keystore test.p12 -storepass 123456 -provisioning-profile test.mobileprovision UDPExtension.ipa UDPExtension-app.xml UDPExtension.swf -extdir "ANE_PATH"

pause