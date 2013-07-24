
#import "zufall.h"
#import "AFNetworking.h"

@interface ViewController22 ()

@end

@implementation ViewController22


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self makeRestuarantsRequests3];
  
}





-(void)makeRestuarantsRequests3{
    

    NSURL *url = [NSURL URLWithString:@"http://api.chefkoch.de/api/1.0/api-recipe.php?zufall=1&divisor=0&limit=1"];
    
   NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                                                                                        success:^(NSURLRequest *request, NSHTTPURLResponse *response, id responseObject) {
                                                                                            self.googlePlacesArrayFromAFNetworking3 = [responseObject objectForKey:@"result"];
                                                                                            NSDictionary *tempDictionary3= [self.googlePlacesArrayFromAFNetworking3 objectAtIndex:0];
                                                                                          self.zubereitung.text = [tempDictionary3 objectForKey:@"rezept_zubereitung"];
                                                                                        		 self.Name.text = [tempDictionary3 objectForKey:@"rezept_name"];
                                                                                       
                                                                                           
                                                                                            self.googlePlacesArrayFromAFNetworking5 =[tempDictionary3 objectForKey:@"rezept_bilder"];
                                                                                            
                                                                                            NSDictionary *tempDictionary4= [self.googlePlacesArrayFromAFNetworking5 objectAtIndex:0];
                                                                                            
                                                                                            NSDictionary *tempDictionary5 = [tempDictionary4 objectForKey:@"bigfix"];
                                                                                            
                                                                                            
                                                                                            [self.Bild setImageWithURL:[NSURL URLWithString:[tempDictionary5 objectForKey:@"file"]]];
                                                                                            
                                                                                            
                                                                                            

                                                                                        }
                                                                                        failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id responseObject) {
                                                                                            NSLog(@"Request Failed with Error: %@, %@", error, error.userInfo);
                                                                                            
                                                                                            
                                                                                        }];
    
    [operation start];
    
    
}


- (IBAction)refresh:(id)sender {
}
@end
