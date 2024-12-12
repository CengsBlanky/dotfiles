## activate idea forever

1. start IDEA and enable trial
2. select Help->Edit Custom VM Options
3. add `-javaagent:<HOME>/FineAgent/FineAgent.jar` to the config file
4. restart IDEA, select Help->Register->Add New Licence, choose `Activation Code`, copy activateCode to here, and DONE

## JDK trouble shoot

1. when run gradle with JDK21, ssl certs error:
```
PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target
```
2. go to the repo website and export its cert file to local computer
3. import cert to JDK keystore:
```
keytool -keystore "{JAVA_HOME}\lib\security\cacerts" -import -alias [cert alias name(any string you like)] -file [crt or cer file location]
```
