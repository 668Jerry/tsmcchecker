//
//  ViewController.m
//  CPU Identifier
//
//  Created by lololol on 14/Oct/15.
//  Copyright © 2015 nouvel. All rights reserved.
//

#import "ViewController.h"
#import <sys/utsname.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    size_t size;
    sysctlbyname("hw.model", NULL, &size, NULL, 0);
    char *chModel = (char*)malloc(size);
    sysctlbyname("hw.model", chModel, &size, NULL, 0);
    NSString *modelName = [NSString stringWithCString:chModel encoding:NSUTF8StringEncoding];
    free(chModel);
    NSLog(@"modelName: %@", modelName);
    UITextView *uitv = [[UITextView alloc]initWithFrame:CGRectMake(0, 100, 320, 200)];
    [self.view addSubview:uitv];
    ([modelName isEqualToString:@"N71AP"] || [modelName isEqualToString:@"N71mAP"])?
    [uitv setText:[NSString stringWithFormat:@"你iphone的modelName是%@, 來自tsmc!!", modelName]]:
    [uitv setText:[NSString stringWithFormat:@"你iphone的modelName是%@, 這不是tsmc!!", modelName]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
