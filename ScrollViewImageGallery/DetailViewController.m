//
//  DetailViewController.m
//  ScrollViewImageGallery
//
//  Created by Spencer Symington on 2019-01-21.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.scrollView.delegate = self;
    self.imageView.image = [UIImage imageNamed:self.imageName];
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    
    return self.imageView;
}

-(void)sendImageName:(NSString*)imageName{
    NSLog(@"message recieved %@",imageName);
    //self.imageView.image = [UIImage imageNamed:imageName];
    self.imageName = imageName;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
