//
//  DetailViewController.h
//  ScrollViewImageGallery
//
//  Created by Spencer Symington on 2019-01-21.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong,nonatomic) NSString *imageName;

-(void)sendImageName:(NSString*)imageName;
@end

NS_ASSUME_NONNULL_END
