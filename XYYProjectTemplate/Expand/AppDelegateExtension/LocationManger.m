//
//  LocationManger.m
//  XYYProjectTemplate
//
//  Created by xuyong on 2017/12/6.
//  Copyright © 2017年 xuyong. All rights reserved.
//

#import "LocationManger.h"
#import <CoreLocation/CoreLocation.h>

@interface LocationManger()<CLLocationManagerDelegate>

@property (nonatomic,strong)  CLLocationManager *locationManager;


@end

@implementation LocationManger

+(instancetype)defaultInstanceLication
{
    return [[self alloc] init];
}

#pragma mark - 定位系统
#pragma mark - 定位
-(void)autoLoaction
{
    // 判断定位操作是否被允许
    if([CLLocationManager locationServicesEnabled]) {
        //定位初始化
        _locationManager=[[CLLocationManager alloc] init];
        _locationManager.delegate=self;
        _locationManager.desiredAccuracy=kCLLocationAccuracyBest;
        _locationManager.distanceFilter=10;
        if ([UIDevice getIOSVersion] >= 8) {
            [_locationManager requestWhenInUseAuthorization];//使用程序其间允许访问位置数据（iOS8定位需要）
        }
        [_locationManager startUpdatingLocation];//开启定位
    }else {
        //提示用户无法进行定位操作
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"定位不成功 ,请确认开启定位" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertView show];
    }
}

// 错误信息
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"error--%@",error);
}

// 6.0 以上调用这个函数
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    NSLog(@"%lu", (unsigned long)[locations count]);
    CLLocation *newLocation = locations[0];
    //    CLLocationCoordinate2D oldCoordinate = newLocation.coordinate;
    //赋值给全局变量
    //    CLLocationCoordinate2D coordinate2D = oldCoordinate;
    [manager stopUpdatingLocation];
    //------------------位置反编码---5.0之后使用-----------------
    //    __weak typeof(self) weakSelf = self;
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:newLocation
                   completionHandler:^(NSArray *placemarks, NSError *error){
                       for (CLPlacemark *place in placemarks) {
                           NSLog(@"place --- %@",place);
                           ///城市
                           NSString *city = place.locality;
                           if (!city) {
                               //四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市）
                               city = place.administrativeArea;
                           }
                           //地址
                           NSArray *lines = place.addressDictionary[@"FormattedAddressLines"];
                           NSString *addressString = [lines componentsJoinedByString:@"\n"];
                           
                           //省会
                           NSString *province = place.administrativeArea;
                           
                           PlaceModel *placeModel        = [[PlaceModel alloc] init];
                           placeModel.contry             = place.country;
                           placeModel.province           = province;
                           placeModel.city               = city;
                           placeModel.subCity            = place.subLocality;
                           placeModel.subThoroughfare    = place.subThoroughfare;
                           placeModel.address            = addressString;
                           placeModel.name               = place.name;
                           placeModel.postalCode         = place.postalCode;
                           [RequestData setPlaceModel:placeModel];
                           
                           //                           weakSelf.locationString = place.locality;
                           [[NSNotificationCenter defaultCenter] postNotificationName:@"PlaceModelReloadNotification" object:nil];
                       }
                   }];
}

// 6.0 调用此函数
-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    NSLog(@"%@", @"ok");
}


@end
