//
//  MenuViewController.m
//  Tiempos
//
//  Created by cesadbe on 9/10/14.
//  Copyright (c) 2014 Andrés Zuleta. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIAlertView *alerta=[[UIAlertView alloc] initWithTitle:@"Bienvenido!" message:_empl.nombreEmpleado delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles: nil];
    [alerta show];
    [self cargarOrdenes];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    HorasViewController *horas = [segue destinationViewController];
    //HorasViewController *horas = [[nav viewControllers] objectAtIndex:0];
    horas.empl = _empl;
}

-(void) cargarOrdenes{
    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat:@"http://190.7.159.122/ficha/json/ordenes_usuario_json.php?id=%@",_empl.idEmpleado ]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,NSData *data, NSError *connectionError)
     {
         NSError * error;
         if (data.length > 0 && connectionError == nil)
         {
             NSDictionary *diccionario = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
             
             
             NSArray *ordenes = [diccionario objectForKey:@"key"];
             NSArray *labels = [diccionario objectForKey:@"value"];

         }else
         {
             UIAlertView *alerta=[[UIAlertView alloc] initWithTitle:@"ERROR!" message:@"Ocurrio un error al descargar las ordenes!" delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles: nil];
             [alerta show];
         }
     }
     ];
}


@end
