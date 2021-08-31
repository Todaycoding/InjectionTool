//  Created by DevDragonLi on 2021/8/18.

#import "InjectionDragonLi.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

#if DEBUG

@implementation InjectionDragonLi

+ (NSString *)authorInfo {
    return @"https://github.com/DevDragonLi";
}

+ (void)load {
    __block id didFinishLaunchingObserver =
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        
        [[NSBundle bundleWithPath:@"/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle"] load];
        [[NSNotificationCenter defaultCenter] removeObserver:didFinishLaunchingObserver];
    }];
    class_addMethod(NSObject.class, NSSelectorFromString(@"injected"), (IMP)injectedObj, "v@:");
}

void injectedObj(id self, SEL _cmd) {
    NSLog(@"RD有改动%@", [self class]);
    
    if ([self isKindOfClass:UIViewController.class]) {
        
        UIViewController * vc = (UIViewController *)self;
        [vc.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        NSLog(@"当前界面%@", [vc class]);
        
        // support lazy property
        unsigned int propertyCount;
        objc_property_t * propertys = class_copyPropertyList(vc.class, &propertyCount);
        for (int i = 0; i < propertyCount; i++) {
            objc_property_t property = propertys[i];
            const char * cPropertyName = property_getName(property);
            NSString * propertyName = [NSString stringWithUTF8String:cPropertyName];
            id propertyValue = [vc valueForKey:propertyName];
            if ([propertyValue isKindOfClass:NSObject.class]) {
                NSObject * obj = (NSObject *)obj;
                @try {
                    [vc setValue:nil forKey:propertyName];
                } @catch (NSException *exception) {
                } @finally {
                    
                }
            }
        }
        free(propertys);
        
        [self awakeFromNib];
        [self loadView];
        [self viewDidLoad];
        [self viewWillAppear:YES];
        [self viewWillLayoutSubviews];
        [self viewDidLayoutSubviews];
        [self viewDidAppear:YES];
    }
    else if ([self isKindOfClass:UIView.class]) {
        UIViewController *vc = [InjectionDragonLi viewControllerSupportView:self];
        if (vc && [vc isKindOfClass:[UIViewController class]]) {
            injectedObj(vc, _cmd);
        }
    }
}

+ (UIViewController *)viewControllerSupportView:(UIView *)view {
    for (UIView * next = [view superview]; next; next = next.superview) {
        UIResponder * nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

@end

#endif

