document.addEventListener("turbolinks:load", function() {

  $("#follow_up_1_yes_no").hide();
  $("#follow_up_1_1_thru_5").hide();
  $("#follow_up_2_0_yes_no").hide();
  $("#follow_up_2_0_1_thru_5").hide();
  $("#follow_up_2_1_yes_no").hide();
  $("#follow_up_2_1_1_thru_5").hide();
  $("#follow_up_2_2_yes_no").hide();
  $("#follow_up_2_2_1_thru_5").hide();
  $("#follow_up_2_3_yes_no").hide();
  $("#follow_up_2_3_1_thru_5").hide();
  $("#follow_up_2_4_yes_no").hide();
  $("#follow_up_2_4_1_thru_5").hide();
  $("#follow_up_2_5_yes_no").hide();
  $("#follow_up_2_5_1_thru_5").hide();
  $("#follow_up_2_6_yes_no").hide();
  $("#follow_up_2_6_1_thru_5").hide();

  $("#response_select_1").change(function(){
    var choice = $("#response_select_1 option:selected").text();
    if (choice == "Yes or No"){
      $("#follow_up_1_yes_no").show()
      $("#follow_up_1_yes_no .form-control").prop("disabled", false)      
      $("#follow_up_1_1_thru_5").hide();
      $("#follow_up_1_1_thru_5 .form-control").prop("disabled", true)      
    }else if (choice == "1 thru 5"){
      $("#follow_up_1_1_thru_5").show();
      $("#follow_up_1_1_thru_5 .if-number").show();
      $("#follow_up_1_1_thru_5 .input-group").hide();
      $("#follow_up_1_1_thru_5 .form-control").prop("disabled", false)
      $("#follow_up_1_yes_no").hide();
      $("#follow_up_1_yes_no .form-control").prop("disabled", true)
    }else if (choice == "Custom"){
      $("#follow_up_1_1_thru_5").show();
      $("#follow_up_1_1_thru_5 .input-group").show();
      $("#follow_up_1_1_thru_5 .if-number").hide();
      $("#follow_up_1_1_thru_5 .form-control").prop("disabled", false)
      $("#follow_up_1_yes_no").hide();
      $("#follow_up_1_yes_no .form-control").prop("disabled", true)
    }else{  
      $("#follow_up_1_yes_no").hide();
      $("#follow_up_1_1_thru_5").hide();
      $("#follow_up_1_yes_no .form-control").prop("disabled", true)
      $("#follow_up_1_1_thru_5 .form-control").prop("disabled", true)
    };
  });

  $("#response_select_2_0").change(function(){
    var choice = $("#response_select_2_0 option:selected").text();
    if (choice == "Yes or No"){
      $("#follow_up_2_0_yes_no").show()
      $("#follow_up_2_0_yes_no .form-control").prop("disabled", false)      
      $("#follow_up_2_0_1_thru_5").hide();
      $("#follow_up_2_0_1_thru_5 .form-control").prop("disabled", true)      
    }else if (choice == "1 thru 5"){
      $("#follow_up_2_0_1_thru_5").show();
      $("#follow_up_2_0_1_thru_5 .form-control").prop("disabled", false)
      $("#follow_up_2_0_yes_no").hide();
      $("#follow_up_2_0_yes_no .form-control").prop("disabled", true)
    }else{  
      $("#follow_up_2_0_yes_no").hide();
      $("#follow_up_2_0_1_thru_5").hide();
      $("#follow_up_2_0_yes_no .form-control").prop("disabled", true)
      $("#follow_up_2_0_1_thru_5 .form-control").prop("disabled", true)
    };
  });

  $("#response_select_2_1").change(function(){
    var choice = $("#response_select_2_1 option:selected").text();
    if (choice == "Yes or No"){
      $("#follow_up_2_1_yes_no").show()
      $("#follow_up_2_1_yes_no .form-control").prop("disabled", false)      
      $("#follow_up_2_1_1_thru_5").hide();
      $("#follow_up_2_1_1_thru_5 .form-control").prop("disabled", true)      
    }else if (choice == "1 thru 5"){
      $("#follow_up_2_1_1_thru_5").show();
      $("#follow_up_2_1_1_thru_5 .form-control").prop("disabled", false)
      $("#follow_up_2_1_yes_no").hide();
      $("#follow_up_2_1_yes_no .form-control").prop("disabled", true)
    }else{  
      $("#follow_up_2_1_yes_no").hide();
      $("#follow_up_2_1_1_thru_5").hide();
      $("#follow_up_2_1_yes_no .form-control").prop("disabled", true)
      $("#follow_up_2_1_1_thru_5 .form-control").prop("disabled", true)
    };
  });

  $("#response_select_2_2").change(function(){
    var choice = $("#response_select_2_2 option:selected").text();
    if (choice == "Yes or No"){
      $("#follow_up_2_2_yes_no").show()
      $("#follow_up_2_2_yes_no .form-control").prop("disabled", false)      
      $("#follow_up_2_2_1_thru_5").hide();
      $("#follow_up_2_2_1_thru_5 .form-control").prop("disabled", true)      
    }else if (choice == "1 thru 5"){
      $("#follow_up_2_2_1_thru_5").show();
      $("#follow_up_2_2_1_thru_5 .form-control").prop("disabled", false)
      $("#follow_up_2_2_yes_no").hide();
      $("#follow_up_2_2_yes_no .form-control").prop("disabled", true)
    }else{  
      $("#follow_up_2_2_yes_no").hide();
      $("#follow_up_2_2_1_thru_5").hide();
      $("#follow_up_2_2_yes_no .form-control").prop("disabled", true)
      $("#follow_up_2_2_1_thru_5 .form-control").prop("disabled", true)
    };
  });

  $("#response_select_2_3").change(function(){
    var choice = $("#response_select_2_3 option:selected").text();
    if (choice == "Yes or No"){
      $("#follow_up_2_3_yes_no").show()
      $("#follow_up_2_3_yes_no .form-control").prop("disabled", false)      
      $("#follow_up_2_3_1_thru_5").hide();
      $("#follow_up_2_3_1_thru_5 .form-control").prop("disabled", true)      
    }else if (choice == "1 thru 5"){
      $("#follow_up_2_3_1_thru_5").show();
      $("#follow_up_2_3_1_thru_5 .form-control").prop("disabled", false)
      $("#follow_up_2_3_yes_no").hide();
      $("#follow_up_2_3_yes_no .form-control").prop("disabled", true)
    }else{  
      $("#follow_up_2_3_yes_no").hide();
      $("#follow_up_2_3_1_thru_5").hide();
      $("#follow_up_2_3_yes_no .form-control").prop("disabled", true)
      $("#follow_up_2_3_1_thru_5 .form-control").prop("disabled", true)
    };
  });

  $("#response_select_2_4").change(function(){
    var choice = $("#response_select_2_4 option:selected").text();
    if (choice == "Yes or No"){
      $("#follow_up_2_4_yes_no").show()
      $("#follow_up_2_4_yes_no .form-control").prop("disabled", false)      
      $("#follow_up_2_4_1_thru_5").hide();
      $("#follow_up_2_4_1_thru_5 .form-control").prop("disabled", true)      
    }else if (choice == "1 thru 5"){
      $("#follow_up_2_4_1_thru_5").show();
      $("#follow_up_2_4_1_thru_5 .form-control").prop("disabled", false)
      $("#follow_up_2_4_yes_no").hide();
      $("#follow_up_2_4_yes_no .form-control").prop("disabled", true)
    }else{  
      $("#follow_up_2_4_yes_no").hide();
      $("#follow_up_2_4_1_thru_5").hide();
      $("#follow_up_2_4_yes_no .form-control").prop("disabled", true)
      $("#follow_up_2_4_1_thru_5 .form-control").prop("disabled", true)
    };
  });

  $("#response_select_2_5").change(function(){
    var choice = $("#response_select_2_5 option:selected").text();
    if (choice == "Yes or No"){
      $("#follow_up_2_5_yes_no").show()
      $("#follow_up_2_5_yes_no .form-control").prop("disabled", false)      
      $("#follow_up_2_5_1_thru_5").hide();
      $("#follow_up_2_5_1_thru_5 .form-control").prop("disabled", true)      
    }else if (choice == "1 thru 5"){
      $("#follow_up_2_5_1_thru_5").show();
      $("#follow_up_2_5_1_thru_5 .form-control").prop("disabled", false)
      $("#follow_up_2_5_yes_no").hide();
      $("#follow_up_2_5_yes_no .form-control").prop("disabled", true)
    }else{  
      $("#follow_up_2_5_yes_no").hide();
      $("#follow_up_2_5_1_thru_5").hide();
      $("#follow_up_2_5_yes_no .form-control").prop("disabled", true)
      $("#follow_up_2_5_1_thru_5 .form-control").prop("disabled", true)
    };
  });

  $("#response_select_2_6").change(function(){
    var choice = $("#response_select_2_6 option:selected").text();
    if (choice == "Yes or No"){
      $("#follow_up_2_6_yes_no").show()
      $("#follow_up_2_6_yes_no .form-control").prop("disabled", false)      
      $("#follow_up_2_6_1_thru_5").hide();
      $("#follow_up_2_6_1_thru_5 .form-control").prop("disabled", true)      
    }else if (choice == "1 thru 5"){
      $("#follow_up_2_6_1_thru_5").show();
      $("#follow_up_2_6_1_thru_5 .form-control").prop("disabled", false)
      $("#follow_up_2_6_yes_no").hide();
      $("#follow_up_2_6_yes_no .form-control").prop("disabled", true)
    }else{  
      $("#follow_up_2_6_yes_no").hide();
      $("#follow_up_2_6_1_thru_5").hide();
      $("#follow_up_2_6_yes_no .form-control").prop("disabled", true)
      $("#follow_up_2_6_1_thru_5 .form-control").prop("disabled", true)
    };
  });

});