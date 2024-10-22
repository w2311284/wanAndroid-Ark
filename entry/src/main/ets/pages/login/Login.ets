import { login } from '../../api/User';
import { LoginFormModel } from '../../models/User';
import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct Login {
  @State message: string = 'Hello World';
  @State loginParam: LoginFormModel = new LoginFormModel({
    username: 'youzhadoubao',
    password: '123456'
  })

  aboutToAppear(): void {
    this.login()
  }

  async login() {
    const user = await login(this.loginParam)
  }

  @Styles
  loginStyle() {
    .backgroundColor('#fff')
    .border({color: Color.Green, width: 1})
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

      Row(){
        Button({type: ButtonType.Capsule}) {
          Text('返回')
        }
        .onClick(() => {
          promptAction.showToast({message: "返回"})
        })
        .zIndex(3)
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)
      .height(64)
      .backgroundColor(Color.Yellow)
      .padding({left:16})

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
        }
        .backgroundColor(Color.Red)
        .margin({top:25})
        .width(80)
        .height(40)
        .enabled(this.getBtnEnable())

        Text('没有账号？来注册吧')
          .margin({top:20})
          .fontSize(14)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .padding({left:20, right:20})
    }
    .width('100%')
    .height('100%')
  }
}