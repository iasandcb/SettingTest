//
//  ViewController.m
//  SettingTest
//
//  Created by ias on 2014. 1. 13..
//  Copyright (c) 2014년 ias. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameField;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(defaultsChanged:) name:NSUserDefaultsDidChangeNotification object:nil];
}

- (void)defaultsChanged:(NSNotification *)notification {
    NSLog(@"CHANGE");
    [self refreshName];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self refreshName];
}

- (void)refreshName {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *name = [defaults objectForKey:@"name_preference"];
    
    NSLog(@"name %@", name);
    self.nameField.text = name;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSString *name = textField.text;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:name forKey:@"name_preference"];
    [defaults synchronize];
    
    [textField resignFirstResponder];
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
