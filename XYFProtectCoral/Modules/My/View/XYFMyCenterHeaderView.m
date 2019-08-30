#import "XYFMyCenterHeaderView.h"
@interface XYFMyCenterHeaderView ()
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UIImageView *guideImageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@end
@implementation XYFMyCenterHeaderView
- (void)awakeFromNib {
    [super awakeFromNib];
    self.headImageView.backgroundColor = [UIColor jsd_mainGrayColor];
    self.headImageView.layer.cornerRadius = 34;
    self.headImageView.layer.masksToBounds = YES;
    self.headImageView.image = [UIImage imageNamed:@"Logo"];
    self.nameLabel.font = [UIFont jsd_fontSize:21];
    self.nameLabel.textColor = [UIColor jsd_mainTextColor];
    self.nameLabel.text = @"小珊瑚";
    
    self.guideImageView.image = [MDCIcons imageFor_ic_chevron_right];
}
- (void)setModel:(JSDUserModel *)model {
    self.nameLabel.text = model.userName;
    if (JSDIsString(model.userImageView)) {
        NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        NSString* filePath = [NSString stringWithFormat:@"%@/%@.png", documentsDirectory, model.userImageView];
        self.headImageView.image = [UIImage imageWithContentsOfFile:filePath];
    } else {
        self.headImageView.image = [UIImage imageNamed:@"Logo"];
        NSLog(@"使用默认");
    }
}
- (void)sp_didGetInfoSuccess {
    NSLog(@"Get User Succrss");
}
- (void)sp_checkNetWorking {
    NSLog(@"Get Info Success");
}
- (void)sp_checkInfo {
    NSLog(@"Check your Network");
}
- (void)sp_checkUserInfo {
    NSLog(@"Get Info Success");
}
- (void)sp_checkDefualtSetting {
    NSLog(@"Get User Succrss");
}
@end
