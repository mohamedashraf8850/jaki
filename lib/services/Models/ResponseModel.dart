
class ResponseModel {
     var  data;
    String  message;
     
      bool success;

  ResponseModel(
      { this.data,
       this.message,
       this.success,
     
      });

       ResponseModel.getALL({
        this.data,
       this.message,
       this.success,
       
  });

  ResponseModel.fromMap(Map<String, dynamic> res) {
    this.data = res['Data'];
    this.message = res['Message'];
    this.success = res['Success'];
    // this.status = res['status'];
   
  }
  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel.getALL(
      data: json['Data'],
      message: json['Message'],
      success: json['Success'],
      // status: json['status'],
    );
  }
  
}
