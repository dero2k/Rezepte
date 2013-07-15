//
//  ViewController.m
//  webTableView
//
//  Created by NSCookbook on 3/4/13.
//  Copyright (c) 2013 NSCookbook. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController






- (void)viewDidLoad
{
    [super viewDidLoad];
    [self makeRestuarantsRequests3];
 
       //self.googlePlacesArrayFromAFNetworking3 = [[NSArray alloc] init];
    [self.restuarantImageView setImageWithURL:[NSURL URLWithString:[self.restuarantDetail objectForKey:@"RezeptBild"]]];
    
    
    //self.restuarantAddressView.text = [self.restuarantDetail objectForKey:@"RezeptName2"];
    self.restuarantNameLabel.text = [self.restuarantDetail objectForKey:@"RezeptName"];
    //self.restaurantnummer.text = [self.restuarantDetail objectForKey:@"RezeptShowID"];
  //  NSDictionary *tempDictionary3= [self.googlePlacesArrayFromAFNetworking3 objectAtIndex:0];
    
    
   // self.label2.text = [tempDictionary3 objectForKey:@"rezept_zubereitung"];

    
}






//343371118405722




-(void)makeRestuarantsRequests3{
    
   // NSString *textfeldsuche2222 = test;
   // NSURL *url = [NSURL URLWithString:@"http://api.chefkoch.de/api/1.0/api-recipe.php?divisor=0&limit=1&ID=343371118405722"];
    
    NSString *rezeptnummer = [self.restuarantDetail objectForKey:@"RezeptShowID"];
  
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.chefkoch.de/api/1.0/api-recipe.php?divisor=0&limit=1&ID=%@",rezeptnummer]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                                                                                        success:^(NSURLRequest *request, NSHTTPURLResponse *response, id responseObject) {
                                                                                            self.googlePlacesArrayFromAFNetworking3 = [responseObject objectForKey:@"result"];
                                                                                              NSDictionary *tempDictionary3= [self.googlePlacesArrayFromAFNetworking3 objectAtIndex:0];
                                                                                                self.restuarantAddressView.text = [tempDictionary3 objectForKey:@"rezept_zubereitung"];
                                                                                            
                                                                                        }
                                                                                        failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id responseObject) {
                                                                                            NSLog(@"Request Failed with Error: %@, %@", error, error.userInfo);
                                                                                    
                                                                                        
                                                                                        }];
    
    
    
 
    [operation start];
    
   
}



    



@end
