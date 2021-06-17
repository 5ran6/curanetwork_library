import 'package:curanetwork_library/imports/imports.dart';

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText, type;
  final BuildContext contextBack; final Future callback;

  CustomDialog({
    required this.title,
    required this.description,
    required this.buttonText,
    required this.type,
    required this.contextBack,
    required this.callback
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }



  dialogContent(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 70,
            bottom: 15,
            left: 15,
            right: 15,
          ),
          margin: EdgeInsets.only(top: 50),
          decoration: BoxDecoration(
            color: Theme.of(contextBack).cardColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(50),
                  color: Theme.of(contextBack).textSelectionHandleColor,
                  fontFamily: AppTheme.mediumFontFamily,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(50),
                  color: Theme.of(contextBack).textSelectionHandleColor,
                  fontFamily: AppTheme.lightFontFamily,
                ),
              ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 85.h,
                  decoration: BoxDecoration(
                      color: AppTheme.iconContainerColor,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.blueTheme.withOpacity(0.5),
                          blurRadius: 6,
                          offset: Offset(0, 1),
                        ),
                      ]),
                  child: FlatButton(
                    color: Colors.transparent,
                    onPressed: () {
                      if(callback == null)
                      Navigator.of(context).pop(); // To close the dialog
                      else
                        callback;
                    },
                    child: Text(
                      buttonText,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(50),
                        color: Colors.white,
                        fontFamily: AppTheme.lightFontFamily,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          child: CircleAvatar(
            backgroundColor: Theme.of(contextBack).cardColor,
            radius: 50,
            child: Container(
//our image
            ),
          ),
        ),
        //...bottom card part,
        //...top circlular image part,
      ],
    );
  }
}
