//
//  ViewController.h
//  MayurWeatherApp
//
//  Created by apple on 20/09/16.
//  Copyright © 2016 felix-its. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *templbl;

@property (weak, nonatomic) IBOutlet UILabel *pressurelbl;

@property (weak, nonatomic) IBOutlet UILabel *humiditylbl;

@property(nonatomic,retain)NSString *url;

@property(nonatomic,retain)NSMutableData *mydata;


@end

