import { router } from '@kit.ArkUI'
import { Cookie, UserSetting } from '@yt/YtKit'
import { getUserInfo } from '../../../api/User'
import { UserInfo, UserInfoModel } from '../../../models/User'

@Preview
@Component
export default struct Mine {
 @State userInfo: UserInfoModel = new UserInfoModel({} as UserInfo)
 @State isLogin: boolean = false

   aboutToAppear() {
     this.isLogin = Cookie.isLoginCookieValid()
     if (this.isLogin) {
       this.getUserInfo()
     }
  }

  async getUserInfo() {
    const result = await getUserInfo()
    this.userInfo = result.userInfo
    AlertDialog.show({message: JSON.stringify(this.userInfo)})
  }

  build(){
    Column(){
      this.header()
      this.container()
    }.width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Start)
    .backgroundColor($r('app.color.mainPage_backgroundColor'))
  }

  @Builder header() {
    Row(){
      Image($r('app.media.avatar'))
        .size({width: 96, height: 96})
        .margin({right:20,left:20})
        .onClick(() => {
          // animateTo({duration: 300},() => {
          //
          //   router.replaceUrl({url: 'pages/login/Login'})
          // })
          router.pushUrl({ url: 'pages/login/Login' })
        })
      Column(){
        Text('未登录')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
        Text('id：')
          .fontSize(12)
          .margin({top:15,bottom:15})
        Row(){
          Text('积分:0')
            .fontSize(12)
          Text('等级:0')
            .fontSize(12)
          Text('排名')
            .fontSize(12)
        }
      }
      .alignItems(HorizontalAlign.Start)
    }
    .padding({top:40, bottom:40})
    .height(150)
    .width('100%')
    .backgroundColor(Color.White)
  }

  @Builder container() {
    this.cell($r('app.media.officialAcount_normal'),"消息中心")
    this.cell($r('app.media.officialAcount_normal'),"分享文章")
    this.cell($r('app.media.officialAcount_normal'),"收藏文章")
    this.cell($r('app.media.officialAcount_normal'),"工具列表")
  }

  @Builder cell(icon: Resource, title: string) {
    Row(){
      Image(icon)
        .size({width:20, height:20})
        .margin({right:10,left:15})
      Text(title)
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
      Blank()
      Image($r('app.media.arrow'))
        .width(16)
        .height(16)
        .margin({right:15})
    }
    .backgroundColor($r('app.color.mainPage_backgroundColor'))
    .width('100%')
    .height(44)
    .onClick((event) => {
      if(title === '消息中心') {
        console.log('点击消息中心')
      }else if(title === '分享文章') {
        console.log('点击分享文章')
      }else if(title === '收藏文章') {
        console.log('点击收藏文章')
      }else if(title === '工具列表') {
        console.log('点击工具列表')
      }
    })
  }
}