//
//  ViewController.m
//  ScrollViewImageGallery
//
//  Created by Spencer Symington on 2019-01-21.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    NSLog(@"creating images");
    //-------------image 1------------------------
    UIImageView *image1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"reboot"]];
    
    [self.scrollView addSubview:image1];
    
    image1.translatesAutoresizingMaskIntoConstraints = NO;
    
    image1.contentMode = UIViewContentModeScaleAspectFill;
    image1.clipsToBounds = YES;
    
    //-------------image 2------------------------
    UIImageView *image2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"freakazoid"]];
    
    [self.scrollView addSubview:image2];
    
    image2.translatesAutoresizingMaskIntoConstraints = NO;
    
    image2.contentMode = UIViewContentModeScaleAspectFill;
    image2.clipsToBounds = YES;
    
    //-------------set layout------------------------
    
    
    [image1.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
    [image1.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
    [image2.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
    [image2.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
    
    [image1.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor].active = YES;
    [image2.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor].active = YES;
    
    // width and height
    [image1.heightAnchor constraintEqualToAnchor:self.view.heightAnchor].active = YES;
    [image2.heightAnchor constraintEqualToAnchor:self.view.heightAnchor].active = YES;
    
    [image1.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
    [image2.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
    
    [image1.trailingAnchor constraintEqualToAnchor:image2.leadingAnchor].active = YES;
    
}
- (IBAction)userTapped:(id)sender {
    NSLog(@"tap detected.");
}


@end
