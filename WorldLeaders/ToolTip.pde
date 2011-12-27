class ToolTip {
  public ToolTip(float x, float y, String tip, String title, String date, int r, int g, int b)
  {
    x-=20;
    y-=85;
    int strLength = tip.length();
    float tooltip_width = 400;
    int font_size = 12;
    int title_size = 16;
    float longest_line = 0;
    PFont font = loadFont("Calibri.vlw");

    for (int i=1;i<=tip.length()/30;i++)
    {
      int new_line = tip.indexOf(" ", 30*i);
      if (new_line!=-1)
      {
        tip = replace(tip, "¬", new_line);
      }
    }

    String[] lines = tip.split("¬");
    //Calculate the longest line.
    float font_scale = (float(title_size)/font_size);
    longest_line = font_scale*(title.length()+date.length());
    for (int i=0;i<lines.length;i++)
    {
      if (lines[i].length()>longest_line)
      {
        longest_line = lines[i].length();
      }
    }
    //Draw the tooltip
    fill(r, g, b, 100);
    round_rect(int(x), int(y), longest_line*(font_size-6), lines.length*font_size, 40);

    //Draw the title
    textFont(font, title_size);
    fill(255);
    shadow(title+" - "+date, x, y, 3);

    //Draw the text
    fill(200);
    textFont(font, font_size);
    for (int i=0;i<lines.length;i++)
    {
      shadow(lines[i], x, y+title_size+4+font_size*i, 2);
    }
  }



  String insert(String original, String insert, int position)
  {
    String tempStart = original.substring(0, position);
    String tempEnd = original.substring(position); 
    return tempStart+insert+tempEnd;
  }
  String replace(String original, String insert, int position)
  {
    String tempStart = original.substring(0, position);
    String tempEnd = original.substring(position); 
    return tempStart+insert+tempEnd.substring(1);
  }

  void round_rect(float x, float y, float w, float h, float r) 
  {
    noStroke();
    rectMode(CORNER);

    float ax;
    float ay;
    float hr;

    ax=x+w-1;
    ay=y+h-1;
    hr = r/2;

    rect(x, y, w, h);
    arc(x, y, r, r, radians(180.0), radians(270.0));
    arc(ax+1, y, r, r, radians(270.0), radians(360.0));
    arc(x, ay+1, r, r, radians(90.0), radians(180.0));
    arc(ax+1, ay+1, r, r, radians(0.0), radians(90.0));
    rect(x, y-hr, w, hr);
    rect(x-hr, y, hr, h);
    rect(x, y+h, w, hr);
    rect(x+w, y, hr, h);
    triangle(x+10, y+h+20, x+20, y+h+40, x+30, y+h+20);
  }
  void shadow(String t, float x, float y, int shadow_size)
  {
    for (int i=1;i<=shadow_size;i++)
    {
      fill(0, 0, 0, 100-100*(i/shadow_size));
      text(t, x+i, y+i);
    }
    fill(255);
    text(t, x, y);
  }
}

