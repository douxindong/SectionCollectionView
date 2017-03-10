//
//  ViewController.m
//  uicollectionview
//
//  Created by 窦心东 on 2017/3/6.
//  Copyright © 2017年 窦心东. All rights reserved.
//

#import "ViewController.h"
#import "HeaderView.h"
#import "FooterView.h"
#import "CollectionViewCell.h"
/**
 *  搜索APIhttp://115.28.11.62:8080/heal/api/heal/usr/plan/search
 */
#define API_Search [APIURL stringByAppendingString:@"heal/api/heal/usr/plan/search"]
#define SCREEN_WIDTH ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?[UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale:[UIScreen mainScreen].bounds.size.width)
#define SCREENH_HEIGHT ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale:[UIScreen mainScreen].bounds.size.height)
#ifdef DEBUG // 开发阶段-DEBUG阶段:使用Log
#define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else // 发布阶段-上线阶段:移除Log
#define NSLog(FORMAT, ...) nil
#endif

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIActionSheetDelegate>
/** _sampleView */
@property (nonatomic,strong) UIImageView *sampleView;
/** shuzu */
@property (nonatomic,strong) NSArray *stringArray1;
/** shuzu */
@property (nonatomic,strong) NSArray *stringArray2;
@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) UICollectionViewFlowLayout *collectionViewFlowLayout;

/** saveImage */
@property (nonatomic,strong) UIImage *saveImage;
@end

@implementation ViewController

-(UICollectionView *)collectionView{
    if (_collectionView==nil) {
        _collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, SCREENH_HEIGHT-20) collectionViewLayout:self.collectionViewFlowLayout];
        _collectionView.delegate = self;// 设置代理
        _collectionView.dataSource = self; // 设置数据源代理
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor colorWithRed:239/255.0f green:237/255.0f blue:237/255.0f alpha:1] ; // 设置背景
        // 注册cell的类型
        // 以代码的方式注册Cell的类型, 表示创建Cell的时候用这个类型来创建
        /*
         第一个参数: Cell的类型
         第二个参数: 重用标志
         */
        //        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"channelID"];
        [_collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"channelID"];
        // 3. 横向间距
        _collectionViewFlowLayout.minimumInteritemSpacing = 5;
        // 4. 纵向间距
        _collectionViewFlowLayout.minimumLineSpacing = 10;
        
        
        
        
        //新建headerView类, 继承自UICollectionReusableView
        //注册header
        /*
         第一个参数:header视图对象的类型
         第二个参数:区分是header还是后面的footer
         // UICollectionElementKindSectionHeader表示header类型
         第三个参数:重用标志
         */
        [_collectionView registerClass:[HeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
        //
        //        //新建FooterView类, 继承自UICollectionReusableView
        //        //注册footer
        [_collectionView registerClass:[FooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
    }
    return _collectionView;
}
- (NSArray *)stringArray1{
    if (_stringArray1 == nil) {
        _stringArray1 = @[@"第一个参数",@"第一数新类一个参数",@"参数",@"第一个参数View类一个参数",@"第一个参数",@"建Fw类",@"第",@"第",@"第一个参数",@"第w类",@"第一个参数",@"第一个参数新ew类"];
    }
    return _stringArray1;
}
- (NSArray *)stringArray2{
    if (_stringArray2 == nil) {
        _stringArray2 = @[@"header视图",@"继承iew",@"heade类型",@"继承自UIC",@"head的类型",@"继承自ableView",@"heade",@"继承",@"header视",@"继承自UICw",@"head",@"继承自"];
    }
    
    return _stringArray2;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.collectionView];
    
    //监听截屏事件
    [self FindJiePing];
    
    
    
    
    
}


- (void)FindJiePing{
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationUserDidTakeScreenshotNotification
                                                      object:nil
                                                       queue:mainQueue
                                                  usingBlock:^(NSNotification *note) {
                                                      // executes after screenshot
                                                      
                                                      NSLog(@"截屏事件发生,执行分享按钮点击事件");
                                                      
                                                  }];
}

#pragma mark - 遵守协议, 实现协议方法
/*
 // 返回每一个Cell的对象
 // UICollectionView上面的每一个Cell是UICollectionViewCell类型(或子类型)的对象
 // UICollectionViewCell也是一个视图
 */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 从重用队列里面获取
    /*
     第一个参数: 重用id
     第二个参数: cell的位置
     */
    
    // UITableView      -> NSIndexPath:section row
    // UICollectionView -> NSIndexPath:section item
    static NSString *moreCellIdentifier = @"channelID";
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:moreCellIdentifier forIndexPath:indexPath];
    
    // 不需要再创建, 从dequeueReusableCellWithReuseIdentifier方法李米娜一定能够获取到
    // 设置背景颜色
    cell.backgroundColor = [UIColor lightGrayColor];
    cell.titlelabel.text = [NSString stringWithFormat:@"%@",indexPath.section ==0?self.stringArray1[indexPath.row]:self.stringArray2[indexPath.row]];
    cell.titlelabel.font = [UIFont fontWithName:@"HelveticaNeue" size:10.0f];
    cell.titlelabel.textColor = [UIColor whiteColor];
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 15;
    return cell;
    
}
#pragma mark - 在布局对象的代理协议方法中设置header的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(SCREEN_WIDTH, 40);
}
#pragma mark - 在布局对象的代理协议方法中设置footer的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(SCREEN_WIDTH, 0);
}
#pragma mark - 返回header对象 UICollectionViewDataSource的协议方法(也可以用来返回footer对象)
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {
        // header类型
        
        // 从重用队列里面获取
        HeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
        
        // 设置背景颜色
        header.backgroundColor = [UIColor redColor];
        
        //        [header addSubview:header.titleLabel];
        // 显示数据
        header.titleLabel.text = [NSString stringWithFormat:@"第%c组", (int)(indexPath.section + 'A')];
        return header;
        
    } else if (kind == UICollectionElementKindSectionFooter) {
        // footer
        
        //         从重用队列里面获取
        FooterView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"footer" forIndexPath:indexPath];
        
        footer.backgroundColor = [UIColor purpleColor];
        // 显示数据
        footer.titleLabel.text = [NSString stringWithFormat:@"第%c组结束", (int)(indexPath.section + 'A')];
        return footer;
    }
    return nil;
}
//#pragma mark - UICollectionViewDelegate methods
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return section==0?self.stringArray1.count:self.stringArray2.count;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    // 3.设置整个collectionView的内边距
    CGFloat paddingY = 5;
    CGFloat paddingX = 20;
    return UIEdgeInsetsMake(paddingY, paddingX, paddingY, paddingX);
    
}

//
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 2.设置每个格子的尺寸
    //    layout.itemSize = CGSizeMake(250, 250);
    CGFloat nameW = [self withString:indexPath.section==0?self.stringArray1[indexPath.row]:self.stringArray2[indexPath.row]];
    
    
    return CGSizeMake((nameW<=80)?80:nameW, 30);
}

- (CGFloat)withString:(NSString *)string{
    
    
    
    //设置string字体  HelveticaNeue  Courier
    UIFont *font = [UIFont fontWithName:@"HelveticaNeue" size:15.0f];
    
    //根据字体得到nsstring的尺寸
    CGSize size = [string sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil]];
    //名字的高
    //    CGFloat nameH = size.height;
    //名字的宽
    CGFloat nameW = size.width;
    
    return nameW>SCREEN_WIDTH?SCREEN_WIDTH-20:nameW;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"点击的是%ld组的第%ld个cell",indexPath.section,indexPath.row);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
