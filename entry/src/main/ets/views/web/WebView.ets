import {webview} from '@kit.ArkWeb'
import { BusinessError } from '@kit.BasicServicesKit';

@Preview
@Component
export struct WebViewComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  url: string = ''


  aboutToAppear(): void {
    console.log("wananzhuo1 url" + this.url)
  }

  build() {
    NavDestination() {

      Web({src: this.url,controller:this.controller})
        .fileAccess(true)
        .javaScriptAccess(true)
        .onlineImageAccess(true)
        .imageAccess(true)
        .mixedMode(MixedMode.All)
        .onHttpErrorReceive((event) => {
          console.error("wananzhuo1 onHttpErrorReceive " )
        })
    }
  }
}