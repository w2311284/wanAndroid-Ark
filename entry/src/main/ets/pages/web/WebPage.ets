import { webview } from '@kit.ArkWeb';
import { router } from '@kit.ArkUI';
import { TitleBar } from '@yt/YtKit';


@Entry
@Component
struct WebPage {
  @State url: string = '';
  @State title : string = '';
  @State mode: WebDarkMode = WebDarkMode.Auto

  controller: webview.WebviewController = new webview.WebviewController();
  aboutToAppear(): void {
    const params = router.getParams() as WebParams
    this.title = params.title
    this.url = params.url

  }
  build() {
    Column(){
      TitleBar({isNeedBack:true,title:this.title,onBackClick: () =>{
         router.back();
      }})
      Web({src: this.url,controller:this.controller})
        .fileAccess(true)
        .javaScriptAccess(true)
        .onlineImageAccess(true)
        .imageAccess(true)
        .domStorageAccess(true)
        .mixedMode(MixedMode.All)
        .onHttpErrorReceive((event) => {
        })
        .darkMode(this.mode)
    }
  }
}

class WebParams {
  url: string = ''
  title: string = ''
}