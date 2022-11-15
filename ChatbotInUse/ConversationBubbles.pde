import java.util.Map;
import java.util.List;

float x, y;

class ConversationBubbles {
  List<Map.Entry<String, String>> conversation;
  int currentBubble;
  
  ConversationBubbles() {
    conversation = new ArrayList<>();
    currentBubble = 0;
  }
  
  void add(String human, String bot) {
    conversation.add(Map.entry(human, bot));
  }
  
 
  
  void display() {
    pushStyle();
    for (int i = 0; i < 50; i += 1) {
      if (i < conversation.size()) {
        Map.Entry<String, String> content = conversation.get(i);
        float boxWidth = width / 2.5;
        float boxHeight = height / 11;
        
        fill(#8e6b96);
        rect(10, i * (height / 6)+30, boxWidth, boxHeight, 0, 25, 0, 25);
        fill(0);
        text(content.getKey(), 15, i * (height / 6)+30 + 0.2 * boxHeight , boxWidth, boxHeight); 
        fill(#b57274);
        rect(width - width / 2.5 - 10, (i + 0.5) * (height / 6)+30, boxWidth, boxHeight, 25, 0, 25, 0);
        fill(0);
        text(content.getValue(), width - width / 2.5, (i + 0.5) * (height / 6)+30 + 0.2 * boxHeight, boxWidth, boxHeight); 
      }
    }
    popStyle();
  }
  
}
