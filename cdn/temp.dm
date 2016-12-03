



## Example

Assume we want to RTL the following document:

**HTML**
```html
<div>
    Title
    <img width="40" 
    src="http://upload.wikimedia.org/wikipedia/commons/6/6a/Light_bulb_icon_tips.svg">
    <hr>
    <br>
      Contents Contents Contents 
      Contents Contents Contents 
      Contents Contents Contents 
      Contents Contents Contents 
      Contents Contents Contents 
      Contents Contents Contents 
</div>    
```

**CSS**
```css
hr {
 margin:10px;
}
img {
    float:right;
    clear:both;
}
div {
    border:solid 10px gray;
    width:200px;
    height:200px;
    padding:2px;
}
div hr {
    margin-right:40px;
}
```

[[jsfiddle](http://jsfiddle.net/LFJCg/)]

![sample 1](https://cloud.githubusercontent.com/assets/4712046/2982787/9969d0ec-dc19-11e3-8772-7861dac3406f.png)


Flipping the above using a subset of RTL overrides is straight forward:

**Override CSS**
```css
/*override*/
body {
    direction:rtl;
}
img {
    float:left;
}
div hr {
    margin-left:40px;   
}
```

[[jsfiddle](http://jsfiddle.net/LFJCg/1)]

![sample 2](https://cloud.githubusercontent.com/assets/4712046/2982788/9969faa4-dc19-11e3-8977-efbfbfc3fcba.png)

As you may have noticed, the above solution does not address resetting the right margin value of the `hr` element! Which may lead to inconsistencies in your RTL version. 

You might say, why not to reset the `margin-right` declaration?

**Override CSS with RESET**
```css
div hr {
    margin-left:40px;   
    margin-right:0 /*or inherit*/;
}
```
[[jsfiddle](http://jsfiddle.net/LFJCg/2)]

![sample 3](https://cloud.githubusercontent.com/assets/4712046/2982789/996aef54-dc19-11e3-87ef-08b2bf749bc3.png)

Still inconsistent with the LTR version, as the value should be `10px` (cascaded by the `HR` CSS rule).

**Override CSS with fixed RESET**
```css
div hr {
    margin-left:40px;   
    margin-right:10px;
}
```

[[jsfiddle](http://jsfiddle.net/LFJCg/3)]

![sample 4](https://cloud.githubusercontent.com/assets/4712046/2982786/9967c900-dc19-11e3-8014-96b6868a256f.png)

Which is an exact mirror of the original LTR version:

![sample 1](https://cloud.githubusercontent.com/assets/4712046/2982787/9969d0ec-dc19-11e3-8772-7861dac3406f.png)



Another important aspect we care for is providing developers with the ability to use the same markup to serve both LTR & RTL versions.

> HTML documents developed for Right-to-Left languages such as Arabic, require setting document direction to `rtl`, this will cause the browser to render its contents from right to left, which means markup elements will be rendered starting from the right side of the screen. 


For example, let's say we want to render a fragment that look like this: `< content >`, Using a UI framework such as [Semantic UI](http://www.semantic-ui.com), we'll be using the framework's icons to represent the left and right angle brackets:

![ltr](https://f.cloud.github.com/assets/4712046/2056521/2f1a720e-8adf-11e3-9124-8483bb87fe5d.png)

[JSFiddle](http://jsfiddle.net/EyHHJ/1)

As you can see, the `ui icon left angle` was rendered to the **left** of the content, and `ui icon right angle` icon rendered to the **right**.

But if we set the document direction to `rtl` - *keeping the markup intact* - the browser will render the `ui icon left angle` icon to the **right** of the content, and the `ui icon right angle` icon to the **left**:

[![rtl-samemarkup](https://f.cloud.github.com/assets/4712046/2056537/b34bcde8-8adf-11e3-9c8f-63becc144f44.png)](http://jsfiddle.net/2Zuct/)

[JSFiddle](http://jsfiddle.net/768P8/1)

Clearly, this is not the intended result! and for a RTL only page, the markup need to be reveresed, such as:

![rtl-reversedmarkup](https://f.cloud.github.com/assets/4712046/2056564/5d1d5f5c-8ae1-11e3-87cf-86359bad9c1f.png) 

[JSFiddle](http://jsfiddle.net/ZjHeY/1)

Great! But what about bilingual sites, do we need to have separate markup to support both LTR and RTL languages ? 

The answer is **No!** We simply reverse the classes, making the [same markup](http://jsfiddle.net/QN4Nb/2) work for both. 

