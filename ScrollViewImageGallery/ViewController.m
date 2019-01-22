//
//  ViewController.m
//  ScrollViewImageGallery
//
//  Created by Spencer Symington on 2019-01-21.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong,nonatomic)NSArray *imageNameArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    
    self.imageNameArray = @[@"reboot",@"freakazoid" ];
    self.pageControl.numberOfPages = 2;
    self.pageControl.currentPage = 0;
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
- (IBAction)pageChanged:(UIPageControl*)sender {
    
    NSLog(@"page changed %li",(long)sender.currentPage);
    
    long page = sender.currentPage;
    float x = (self.scrollView.frame.size.width*page);
    float y = 0;
    float width = self.scrollView.frame.size.width;
    float height = self.scrollView.frame.size.height;
    
    
    CGRect frame = CGRectMake(x, y,width ,height ); //wherever you want to scroll
    [self.scrollView scrollRectToVisible:frame animated:YES];
    
}
- (IBAction)userTapped:(id)sender {
    NSLog(@"tap detected.");
    
   
    [self performSegueWithIdentifier:@"toDetails" sender:self];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(NSString*)sender{
    NSLog(@"preparing for segue");
    DetailViewController* detailViewController = segue.destinationViewController;
    
    int page = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
    //detailViewController.imageView.image = [UIImage imageNamed: @"reboot"];
    
    [detailViewController sendImageName:self.imageNameArray[page]];
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int page = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
    self.pageControl.currentPage = page;
}

@end
