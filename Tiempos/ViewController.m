//
//  ViewController.m
//  Tiempos
//
//  Created by Andrés Zuleta on 6/09/14.
//  Copyright (c) 2014 Andrés Zuleta. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    return YES;
}

- (IBAction)btnIngresar:(id)sender {
    NSString *usuario = _usuarioTxt.text;
    NSString *password = _passwordTxt.text;
    
    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat:@"http://190.7.159.122/ficha/json/ingreso_json.php?usuario=%@&pass=%@",usuario,password ]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue]
        completionHandler:^(NSURLResponse *response,NSData *data, NSError *connectionError)
        {
            NSError * error;
            if (data.length > 0 && connectionError == nil)
            {
                NSDictionary *diccionario = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                
                if([[diccionario objectForKey:@"error"] isEqualToString:@"1"]){
                    UIAlertView *alerta=[[UIAlertView alloc] initWithTitle:@"ERROR!" message:[diccionario objectForKey:@"mensaje"] delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles: nil];
                    [alerta show];
                }else{                    
                    _emp = [[Empleado alloc] init];
                    _emp.nombreEmpleado = [diccionario objectForKey:@"nombre"];
                    _emp.idEmpleado = [diccionario objectForKey:@"idusuario"];
                    //LLamado al boton del segue
                    [_btnIngresarValidado sendActionsForControlEvents:UIControlEventTouchUpInside];
                }
            }else
            {
                UIAlertView *alerta=[[UIAlertView alloc] initWithTitle:@"ERROR!" message:@"Ocurrio un error al momento del login!" delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles: nil];
                [alerta show];
            }
        }
     ];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UINavigationController *nav = [segue destinationViewController];
    MenuViewController *menu_ = [[nav viewControllers] objectAtIndex:0];
    menu_.empl = _emp;
}

@end
