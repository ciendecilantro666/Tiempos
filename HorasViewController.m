//
//  HorasViewController.m
//  Tiempos
//
//  Created by Andrés Zuleta on 9/09/14.
//  Copyright (c) 2014 Andrés Zuleta. All rights reserved.
//

#import "HorasViewController.h"

@interface HorasViewController ()

@end

@implementation HorasViewController

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
    self.scroller.contentSize = CGSizeMake(320,790);
    [_scroller setScrollEnabled:YES];
    

 
    NSString * ruta = [[NSBundle mainBundle] pathForResource:@"horas" ofType:@"plist"];
    _horas= [[NSArray alloc] initWithContentsOfFile:ruta];
    
    NSLog(@"%@", _horas);
    _pickerHoras.delegate = self;
    _pickerHoras.dataSource = self;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [_horas count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [_horas objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    UIAlertView * alerta = [[UIAlertView alloc] initWithTitle:@"Seleccion" message:[_horas objectAtIndex:row] delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles: nil];
    [alerta show];
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

@end
