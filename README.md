# PPMultipleSBs
Test project to understand how an UITabBarController can manage VCs from multiple storyboards.

Main layout is an UINavigationController as the root view controller. 
As the UITabController must be instantiated programmatically in the code there must be an intermediate container UIViewController to act as top VC for the UINavigationController.
This intermediate VC will contain the UITabController.
Each of the UITabController managed VCs will be on a different UIStoryboard.

On `AppDelegate`'s `application:didFinishLaunchingWithOptions:` there's the "magic": 

````
    UINavigationController *navVC = (UINavigationController*) self.window.rootViewController;
    UIViewController *mainVC = navVC.topViewController;
    
    UITabBarController *tabBar = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"TabBarController"];
    UIViewController *vc1 = [[UIStoryboard storyboardWithName:@"sb1" bundle:nil] instantiateViewControllerWithIdentifier:@"vc1"];
    UIViewController *vc2 = [[UIStoryboard storyboardWithName:@"sb2" bundle:nil] instantiateViewControllerWithIdentifier:@"vc2"];
    
    tabBar.viewControllers = @[vc1,vc2];

    [mainVC addChildViewController:tabBar];
    [mainVC.view addSubview:tabBar.view];

````



