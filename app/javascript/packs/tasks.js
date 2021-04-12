window.addEventListener("load", function() {
  "use strict";



    
    var nodesList = document.getElementsByClassName("node");
    var connection = [];
    var lines = [];
    console.log(nodesList);



      //creating the array of tasks
       for (var i = 0; i < nodesList.length; i++) 
      {
        connection[i]=[];

      }


      //assigning each task their child and parent
      for (var i = 0; i < nodesList.length; i++) 
      {
        var tmp = nodesList[i].getElementsByClassName('node-name')[0].id
        if(tmp)
        {
            connection[tmp-1].push(i);
            //connection[i].push(tmp-1);
          }
      }


      //creating the lines
      for (var x = 0; x < connection.length; x++) 
      {
        console.log()
        for (var y = 0; y < connection[x].length; y++) 
        {
            console.log(document.getElementsByClassName("name active")[x*2])
            console.log(document.getElementsByClassName("name active")[x*connection[x][y]+1])



          var tmpLine = new LeaderLine(document.getElementsByClassName("name active")[x*2], document.getElementsByClassName("name active")[x*connection[x][y]+1], {
            startPlug: "behind",
            endPlug: "behind",
            size: 4,
            startPlugSize: 1,
            endPlugSize: 1,
            startSocket: "left",
            endSocket: "right",    
            color: "#30c117"

          });
          console.log(1);
          lines.push(tmpLine);
        }

      }


      for (var x = 0; x < nodesList.length; x++) 
      {
         new PlainDraggable(nodesList[x], {
          onMove: function() {
            for (var y = 0; y < lines.length; y++) 
              {
              lines[y].position();
              }
          },

        });


      }


     
      console.log(lines);
      

function myFunction(elem){
  document.location.href = "https://powerful-waters-96115.herokuapp.com/tasks/"+elem;
}

  
});
