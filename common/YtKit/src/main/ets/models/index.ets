export class ResponseData<T> {
  errorCode: number = 0
  errorMsg: string = ''
  data: T | null = null
}