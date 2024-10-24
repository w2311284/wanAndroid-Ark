import { LoginForm, LoginFormModel } from '../../models/User';
import { promptAction, router } from '@kit.ArkUI';
import { login } from '../../api/User';
import { TOKEN_KEY, UserSetting } from '@yt/YtKit';

@Preview
@Entry
@Component
struct Login {
  @State message: string = 'Hello World';
  @State loginParam: LoginFormModel = new LoginFormModel({
    username: 'youzhadoubao',
    password: '123456'
  } as LoginForm)

  async login() {
    const user = await login(this.loginParam)
    const token = JSON.stringify(user)
    await new UserSetting(getContext()).setToken(token)
    AppStorage.setOrCreate(TOKEN_KEY,token)
    promptAction.showToast({message:'登录成功'})
    router.back()
  }

  @Styles
  loginStyle() {
    .backgroundColor('#fff')
    .border({color: $r('app.color.primary'), width: 1})
    .borderRadius(5)
    .height(55)
  }

  getBtnEnable() {
    if (this.loginParam.username && this.loginParam.password) {
      return true
    }else {
      return false
    }
  }

  build() {
    Stack({alignContent: Alignment.Top}) {
      Column() {
        Image($r('app.media.avatar'))
          .width(100)
          .height(100)
          .margin({top: -120})
        TextInput({placeholder: '用户名',text: this.loginParam.username})
          .loginStyle()
          .margin({top: 40, bottom:30})
          .onChange((value) => {
            this.loginParam.username = value
          })
        TextInput({placeholder: '密码',text: this.loginParam.password})
          .loginStyle()
          .showPassword(true)
          .type(InputType.Password)
          .onChange((value) => {
            this.loginParam.password = value
          })

        Button({type: ButtonType.Capsule}){
          Text('登录')
            .fontColor($r('app.color.white'))
        }
        .backgroundColor($r('app.color.primary'))
        .margin({top:25})
        .width(80)
        .height(40)
        .enabled(this.getBtnEnable())
        .onClick(() => {
          this.login()
        })

        Text('没有账号？来注册吧')
          .margin({top:20})
          .fontSize(14)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .padding({left:20, right:20})


      Row(){
        Image($r('app.media.ic_arrow_back'))
          .width(24)
          .height(24)
          .onClick(() => {
            router.back()
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)
      .height(64)
      .padding({left:16})
    }
    .width('100%')
    .height('100%')
  }
}