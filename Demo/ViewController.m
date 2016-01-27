//
//  ViewController.m
//  Demo
//
//  Created by amoblin on 16/1/27.
//  Copyright © 2016年 marboo. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+CustomKVOOperators.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *array = @[@{@"name": @{@"1":@"2"}, @"age": @2},
                       @{@"name": @{@"2":@"3"}, @"age": @4},
                       @{@"name": @{@"3":@"4"}, @"age": @4},
                       @{@"name": @{@"4":@"5"}, @"age": @4},
                       @{@"name": @{@"5":@"6"}, @"age": @4}];
//                       @{@"name": @"3", @"age": @6},
//                       @{@"name": @"4", @"age": @8},
//                       @{@"name": @"5", @"age": @10}];
    NSDictionary *dict = @{@"k1": array};
    NSLog(@"%@", [array valueForKeyPath:@"@last.name"]);
//    NSLog(@"%@", [dict valueForKeyPath:@"k1.@1.name"]);
//    NSLog(@"%@", [dict valueForKeyPath:@"k1.name.@i0"]);
}

- (void)test;
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
