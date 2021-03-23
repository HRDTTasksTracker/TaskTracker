window.addEventListener("load", function() {
  "use strict";


var oldButton=document.getElementById('addButton');
var oldLine;
var elem = 1;

document.getElementById('addButton').addEventListener('click', addButtonToContainer);


function addButtonToContainer() {
    const container = document.getElementById('container');
    var button1 = document.createElement('button');
    button1.innerText = 'Task '+ elem;
    elem = elem+1;

    container.appendChild(button1);
    var lineTim;

 

 lineTim = new LeaderLine(button1, oldButton, {
    startPlug: "behind",
    endPlug: "behind",
    size: 4,
    startPlugSize: 1,
    endPlugSize: 1,
    startSocket: "left",
    endSocket: "right",    
    color: "#30c117"
    // path: 'grid',
    // dropShadow: {color: '#111', dx: 0, dy: 2, blur: 0.2}
  });


    new PlainDraggable(button1, {
    onMove: function() {
      lineTim.position();
      oldLine.position();
    },
    // onMoveStart: function() { line.dash = {animation: true}; },
  
  });

    

 oldButton=button1;
 oldLine=lineTim;

}

  var slot1_out = document.getElementById("slot-anchor-4"),
    slot2_in = document.getElementById("slot-anchor-2-tim"),
    slot3_in = document.getElementById("slot-anchor-3-tim"),
    slot4_out = document.getElementById("slot-anchor-4"),
    slot5_in = document.getElementById("slot-anchor-5"),


    node3_out = document.getElementById("slot-anchor-3-out-tim"),
    node4_out = document.getElementById("slot-anchor-5-out"),
    node5_in = document.getElementById("node_5_tim_in"),
    
    slot2_out = document.getElementById("slot-anchor-2-out-tim"),

    node_4_slot1_in = document.getElementById("node_4_slot1_in"),
    lt_slot1_out = document.getElementById("lt_slot1_out"),
    line1,
    line2,
    line3,
    line4,
    line5;


      line1 = new LeaderLine(slot2_in, slot1_out, {
    startPlug: "behind",
    endPlug: "behind",
    size: 4,
    startPlugSize: 1,
    endPlugSize: 1,
    startSocket: "left",
    endSocket: "right",
    color: "#30c117"
   
  });
  line2 = new LeaderLine(slot3_in, slot2_out, {
    startPlug: "behind",
    endPlug: "behind",
    size: 4,
    startPlugSize: 1,
    endPlugSize: 1,
    startSocket: "left",
    endSocket: "right",
    color: "#30c117"
 
  });

  
  line3 = new LeaderLine(slot5_in, slot4_out, {
    startPlug: "behind",
    endPlug: "behind",
    size: 4,
    startPlugSize: 1,
    endPlugSize: 1,
    startSocket: "left",
    endSocket: "right",
    color: "#30c117",
   
  });

   line4 = new LeaderLine(node3_out, node_5_tim_in, {
    startPlug: "behind",
    endPlug: "behind",
    size: 4,
    startPlugSize: 1,
    endPlugSize: 1,
    startSocket: "left",
    endSocket: "left",
    color: "#30c117",
    
  });

  line5 = new LeaderLine(node4_out, node_5_tim_in, {
    startPlug: "behind",
    endPlug: "behind",
    size: 4,
    startPlugSize: 1,
    endPlugSize: 1,
    startSocket: "left",
    endSocket: "right",
    color: "#30c117",
    
  });

  // Drag Nodes

  // Drag Nodes and redraw lines
  new PlainDraggable(node_1, {
    onMove: function() {
      line1.position();
      line2.position();
      line3.position();
    },

  });

  new PlainDraggable(node_2, {
    onMove: function() {
      line1.position();
      line2.position();
    },
    // onMoveStart: function() { line.dash = {animation: true}; },
    onDragEnd: function() {
      line.dash = false;
    }
  });

  new PlainDraggable(node_3, {
    onMove: function() {
      line1.position();
      line2.position();
      line3.position();
      line4.position();
    }
  });
  new PlainDraggable(node_4, {
    onMove: function() {
      line3.position();
      line5.position();
    },

  });


  new PlainDraggable(node_5_tim, {
    onMove: function() {
      line4.position();
      line5.position();
    },

  });
  
  
});
