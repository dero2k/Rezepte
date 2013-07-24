


#import "zufall.h"
#import "AFNetworking.h"

@interface ViewController22 ()

@end

@implementation ViewController22






- (void)viewDidLoad
{
    [super viewDidLoad];
    [self makeRestuarantsRequests3];
    
    //self.googlePlacesArrayFromAFNetworking3 = [[NSArray alloc] init];
    //[self.Bild setImageWithURL:[NSURL URLWithString:[self.restuarantDetail objectForKey:@"RezeptBild"]]];
    
    
    //self.restuarantAddressView.text = [self.restuarantDetail objectForKey:@"RezeptName2"];
    
    //self.restaurantnummer.text = [self.restuarantDetail objectForKey:@"RezeptShowID"];
   
    
    // self.label2.text = [tempDictionary3 objectForKey:@"rezept_zubereitung"];
    
    
    
}






//343371118405722




-(void)makeRestuarantsRequests3{
    
    // NSString *textfeldsuche2222 = test;
    NSURL *url = [NSURL URLWithString:@"http://api.chefkoch.de/api/1.0/api-recipe.php?zufall=1&divisor=0&limit=1"];
    
    //NSString *rezeptnummer = [self.restuarantDetail objectForKey:@"RezeptShowID"];
    
   // NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.chefkoch.de/api/1.0/api-recipe.php?divisor=0&limit=1&ID=%@",rezeptnummer]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                                                                                        success:^(NSURLRequest *request, NSHTTPURLResponse *response, id responseObject) {
                                                                                            self.googlePlacesArrayFromAFNetworking3 = [responseObject objectForKey:@"result"];
                                                                                            NSDictionary *tempDictionary3= [self.googlePlacesArrayFromAFNetworking3 objectAtIndex:0];
                                                                                          self.zubereitung.text = [tempDictionary3 objectForKey:@"rezept_zubereitung"];
                                                                                        		 self.Name.text = [tempDictionary3 objectForKey:@"rezept_name"];
                                                                                       

                                                                                        }
                                                                                        failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id responseObject) {
                                                                                            NSLog(@"Request Failed with Error: %@, %@", error, error.userInfo);
                                                                                            
                                                                                            
                                                                                        }];
    
    
    
    
    [operation start];
    
    
}







- (IBAction)refresh:(id)sender {
}
@end
