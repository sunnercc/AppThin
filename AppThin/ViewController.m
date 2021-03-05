//
//  ViewController.m
//  AppThin
//
//  Created by sunner on 2021/3/2.
//  Copyright © 2021 sunner. All rights reserved.
//

#import "ViewController.h"
#import "Files.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *files = [Files findAllFilesIn:@"/Users/sunner/Desktop/projects/measureapp/AJJ-Measure" suffix:@[@".m", @".mm"]];
    // 查找到所有的@“xx”资源
    [Files findResoucesIn:files pattern:@"@\"(.+)\""];
}

@end
