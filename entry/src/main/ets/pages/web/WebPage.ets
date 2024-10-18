import { webview } from '@kit.ArkWeb';
import { router } from '@kit.ArkUI';

@Entry
@Component
struct WebPage {
  @State url: string = '';
  controller: webview.WebviewController = new webview.WebviewController();
  aboutToAppear(): void {
    const params = router.getParams() as WebParams
    this.url = params.url
  }
  build() {
    Column(){
      Web({src: this.url,controller:this.controller})
        .fileAccess(true)
        .javaScriptAccess(true)
        .onlineImageAccess(true)
        .imageAccess(true)
        .mixedMode(MixedMode.All)
        .onHttpErrorReceive((event) => {
        })
    }
  }
}

class WebParams {
  url: string = ''
}