//
//  HorasViewController.h
//  Tiempos
//
//  Created by Andrés Zuleta on 9/09/14.
//  Copyright (c) 2014 Andrés Zuleta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Empleado.h"

@interface HorasViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>{
    
   
}

@property IBOutlet UIScrollView *scroller;

@property (strong, nonatomic) IBOutlet UIPickerView *pickerHoras;

@property NSArray * horas;

@property Empleado *empl;




@end
