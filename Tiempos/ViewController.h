//
//  ViewController.h
//  Tiempos
//
//  Created by Andrés Zuleta on 6/09/14.
//  Copyright (c) 2014 Andrés Zuleta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Empleado.h"
#import "MenuViewController.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usuarioTxt;
@property (weak, nonatomic) IBOutlet UITextField *passwordTxt;
- (IBAction)btnIngresar:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnIngresarValidado;

@property Empleado *emp;

@end
