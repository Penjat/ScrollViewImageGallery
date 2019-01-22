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
    
    //figure out the scalling between the frame and the image size
    //find for width
    float scalingFactorX = self.view.frame.size.width / self.imageView.image.size.width;
    
    //find for height
    float scalingFactorY = self.view.frame.size.height / self.imageView.image.size.height;
    
    //then choose the smaller one
    if(scalingFactorX < scalingFactorY){
        self.scrollView.zoomScale = scalingFactorX;
    }else{
        self.scrollView.zoomScale = scalingFactorY;
    }
    
    
    
    
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
