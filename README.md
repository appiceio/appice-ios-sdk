## appICE-iOS-SDK

appICE is a mobile marketing platform which helps businesses build trustworthy personalized relationships with their customers through push notifications, in-app campaigns, email campaigns and other messaging channels.

## Integration
### Integration through CocoaPods

CocoaPods is a dependency manager for Objective C (or Swift) projects and makes integration easier.
1. If you don't have CocoaPods installed, you can do it by executing the following line in your terminal.

   ```sudo gem install cocoapods```

2. If you don't have a Podfile, create a plain text file named Podfile in the Xcode project directory with the following content, making sure to set the platform and   
   version that matches your app.
   
   ```pod 'AppICE-IOS-SDK'```

3. Install MoEngage SDK by executing the following in the Xcode project directory.

   ```pod install```

4. Now, open your project workspace and check if MoEngage SDK is properly added.

### SDK Initialization

Login to your appICE account, go to Settings in the left panel of the dashboard. Under App Settings, you will find your APP ID, APP KEY, API KEY. Provide these details while initializing the SDK as shown below:
1. Import the appICE.h file in the beginning of your appdelegate.m file.

   ```#import “appICE.h”```

2. Add appICE project attributes.

   ```(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {```
  
   ```[appICE setupKeys:@"YOUR_APP_KEY" withapiKey:@"YOUR_API_KEY" withappId:@"YOUR_APP_ID" otherSdkdeviceId:@"OtherAnalytics_distinctID" region:nil baseUrl:nil```  
   ```certficates:nameArr];```
   ```}```
   
   NOTE: If you are not using any other analytics tool in your project, please replace OtherAnalytics_distinctID with “” (i.e. empty string)
   
3. Initialize appICE SDK.

   ```[[appICE sharedInstance] startContext];```
   
Thats it!! SDK is successfully integrated in the project and is ready to use.
