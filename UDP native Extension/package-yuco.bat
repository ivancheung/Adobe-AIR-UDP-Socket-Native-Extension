echo Replace DLL_PATH and SDK_PATH before running
pause

"D:\downloads\flex_sdk_4.5.1\bin\adt.bat" -package -storetype pkcs12 -keystore test.p12 -storepass test -target ane UDPExtension.ane extension.xml -swc UDPExtension.swc -platform iPhone-ARM library.swf libUDPNativeExtension.a

pause