import { router } from '@kit.ArkUI'
import { Cookie } from '@yt/YtKit'
import { getUserInfo } from '../../../api/User'
import { CoinInfo, CoinInfoModel } from '../../../models/Coin'
import { UserInfo, UserInfoModel, UserModel } from '../../../models/User'

@Preview
@Component
export default struct Mine {
  @State userInfo: UserInfo = new UserInfoModel({} as UserInfo)
  @State coinInfo: CoinInfo = new CoinInfoModel({} as CoinInfo)
  @State isLogin: boolean = false

  aboutToAppear() {
    this.isLogin = Cookie.isLoginCookieValid()
    if (this.isLogin) {
      this.getUserInfo()
    }
  }

  async getUserInfo() {
    const result = await getUserInfo() as UserModel
    this.userInfo = result.userInfo
    this.coinInfo = result.coinInfo
  }

  build() {
    Column() {
      this.header()
      this.container()
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Start)
    .backgroundColor($r('app.color.surface_container'))
  }

  @Builder
  header() {
    Row() {
      Image($r('app.media.avatar'))
        .size({ width: 96, height: 96 })
        .margin({ right: 20, left: 20 })
        .onClick(() => {
          if (!this.isLogin) {
            router.pushUrl({ url: 'pages/login/Login' })
          }
        })
      Column() {
        Text(`用户名：${this.isLogin ? this.userInfo.nickname : '未登录'}`)
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.on_surface'))
        Text(`id：${this.userInfo.id}`)
          .fontSize(12)
          .fontColor($r('app.color.on_surface'))
          .margin({ top: 15, bottom: 15 })
        Row({ space: 5 }) {
          Text(`积分：${this.coinInfo.coinCount}`)
            .fontSize(12)
            .fontColor($r('app.color.on_surface'))
          Text(`等级：${this.coinInfo.level}`)
            .fontSize(12)
            .fontColor($r('app.color.on_surface'))
          Text(`排名：${this.coinInfo.rank}`)
            .fontSize(12)
            .fontColor($r('app.color.on_surface'))
          Image($r('app.media.arrow'))
            .width(12)
            .height(12)
            .fillColor($r('app.color.on_surface'))
            .onClick(() => {
              if (!this.isLogin) {
                this.toLoginPage()
              } else {
                router.pushUrl({
                  url: 'pages/coin/CoinList',
                  params: {
                    coinInfo: this.coinInfo
                  }
                })
              }
            })
        }
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
    }
    .padding({ top: 40, bottom: 40 })
    .height(150)
    .width('100%')
    .backgroundColor($r('app.color.surface'))
  }

  private toLoginPage() {
    router.pushUrl({ url: 'pages/login/Login' })
  }

  @Builder
  container() {
    this.cell($r('app.media.officialAcount_normal'), "消息中心")
    this.cell($r('app.media.officialAcount_normal'), "分享文章")
    this.cell($r('app.media.officialAcount_normal'), "收藏文章")
    this.cell($r('app.media.officialAcount_normal'), "工具列表")
  }

  @Builder
  cell(icon: Resource, title: string) {
    Row() {
      Image(icon)
        .fillColor($r('app.color.on_surface'))
        .size({ width: 20, height: 20 })
        .margin({ right: 10, left: 15 })
      Text(title)
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.on_surface'))
      Blank()
      Image($r('app.media.arrow'))
        .width(16)
        .height(16)
        .margin({ right: 15 })
        .fillColor($r('app.color.on_surface'))
    }
    .width('100%')
    .height(44)
    .onClick((event) => {
      if (title === '消息中心') {
        console.log('点击消息中心')
      } else if (title === '分享文章') {
        console.log('点击分享文章')
      } else if (title === '收藏文章') {
        if (this.isLogin) {
          router.pushUrl({
            url: 'pages/collect/CollectList'
          })
        }else  {
          this.toLoginPage()
        }
      } else if (title === '工具列表') {
        router.pushUrl({
          url:'pages/Tools/ToolList'
        })
      }
    })
  }
}