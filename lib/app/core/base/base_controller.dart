// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:one_day_one_something/app/core/page_state.dart';
import 'package:one_day_one_something/flavors/build_config.dart';
import 'package:logger/logger.dart';

import '../../data/network/exceptions/api_exception.dart';
import '../../data/network/exceptions/app_exception.dart';
import '../../data/network/exceptions/json_format_exception.dart';
import '../../data/network/exceptions/network_exception.dart';
import '../../data/network/exceptions/not_found_exception.dart';
import '../../data/network/exceptions/service_unavailable_exception.dart';
import '../../data/network/exceptions/timeout_exception.dart';
import '../../data/network/exceptions/unauthorize_exception.dart';

abstract class BaseController extends GetxController {
  final Logger logger = BuildConfig.instance.config.logger;

  final logoutController = false.obs;

  //페이지 리로드
  final _refreshController = false.obs;

  refreshPage(bool refresh) => _refreshController(refresh);

  //페이지 상태 관리
  final _pageStateController = PageState.DEFAULT.obs;

  PageState get pageState => _pageStateController.value;

  //페이지 업데이트
  updatePageState(PageState state) => _pageStateController(state);
  //페이지 초기화
  resetPageState() => _pageStateController(PageState.DEFAULT);
  //로딩 보여주기
  showLoading() => updatePageState(PageState.LOADING);
  //로딩 끄기
  hideLoading() => resetPageState();

  //메세지 관리
  final _messageController = ''.obs;
  String get message => _messageController.value;
  showMessage(String msg) => _messageController(msg);

  //에러메세지 관리
  final _errorMessageController = ''.obs;
  String get errorMessage => _errorMessageController.value;
  showErrorMessage(String msg) {
    _errorMessageController(msg);
  }

  //성공메세지 관리
  final _successMessageController = ''.obs;
  String get successMessage => _messageController.value;
  showSuccessMessage(String msg) => _successMessageController(msg);

  // ignore: long-parameter-list
  //Dio로 Api 요청하기
  dynamic callDataService<T>(
    Future<T> future, {
    Function(Exception exception)? onError,
    Function(T response)? onSuccess,
    Function? onStart,
    Function? onComplete,
  }) async {
    Exception? _exception;

    onStart == null ? showLoading() : onStart();

    try {
      final T response = await future;

      if (onSuccess != null) onSuccess(response);

      onComplete == null ? hideLoading() : onComplete();

      return response;
    } on ServiceUnavailableException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on UnauthorizedException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on TimeoutException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on NetworkException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on JsonFormatException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on NotFoundException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on ApiException catch (exception) {
      _exception = exception;
    } on AppException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } catch (error) {
      _exception = AppException(message: "$error");
      logger.e("Controller>>>>>> error $error");
    }

    if (onError != null) onError(_exception);

    onComplete == null ? hideLoading() : onComplete();
  }

  //토스트 메세지 띄우기
  void showToast(String message) {
    Fluttertoast.showToast(
        msg: message, toastLength: Toast.LENGTH_SHORT, timeInSecForIosWeb: 1);
  }

  //종료시 초기화
  @override
  void onClose() {
    _messageController.close();
    _refreshController.close();
    _pageStateController.close();
    super.onClose();
  }
}
