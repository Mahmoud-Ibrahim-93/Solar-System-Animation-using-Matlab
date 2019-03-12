# Solar System Animation using Matlab



## Code Functions/scripts
    * draw_sphere (Function)
    * animateOrbit (Function)
    * saveGif (Function)
    * Start (Script)
  
  
## draw_sphere (Function)
    [surfHandle,surfX,surfY] = draw_sphere(A,X_Center,Y_Center)  
    draws a sphere with radius A and center coordinates(X_Center,Y_Center)  
    And returns the surf handle and X & Y data
  
  ### call Example
    draw_sphere(5,0,0);
  
  ### Result  
  ![SampleTestCase1](https://user-images.githubusercontent.com/12980543/54228811-a2374a00-450b-11e9-80b9-43a7345edc15.jpg)

  ###  animateOrbit (Function)
     animateOrbit(StarRadius,planetRadius,majorAxis,minorAxis)
     Animate a Solar system with a star in the middle and a planet / planets. 
  
  ### call Example with one planet
    animateOrbit(200,25,1000,750)
  
  ![SampleTestCase2](https://user-images.githubusercontent.com/12980543/54229189-736da380-450c-11e9-86af-7fd8fd6c5fbf.gif)
  
  ### call Example with multiple planets of parallel eliptical orbits
    animateOrbit(300,[25 150 75],[1000,2000,3000],[750,1500,2250]);
  
  ![SampleTestCase3](https://user-images.githubusercontent.com/12980543/54229263-98621680-450c-11e9-8bec-c46aab67bcac.gif)

  ### call Example with multiple planets of non-parallel eliptical orbits
    animateOrbit(300,[25 150 75],[1300,2200,3500],[1000,2000,2500]);
  
  ![SampleTestCase4](https://user-images.githubusercontent.com/12980543/54229326-b760a880-450c-11e9-9f33-c629cc62e645.gif)
  
  ##  saveGif (Function)
    allows you to save the animation in a GIF file. uncomment line 99 in animateOrbit function to Enable it
  
  ##  Start (Script)
      Starts The animation & holds 3 important control variables NumberOfCirculations speeds TimeSteps
  ### NumberOfCirculations
      determines the number of orbits the planets do before the animation stops
  ### speeds
      Controls the speed of each planet
  ### TimeSteps
      Controls the the smoothness of transition over the circular orbit
  ## Testing lines section has 4 test cases in lines 14 - 17 - 20 - 24
      uncomment any line of those to test the results
      
  # Supported Features:
    - multiple planet representation
    - Speed Control for each planet
    - Transition smoothness control
    - eliptical path control via major and minor axes sizes
    - save animation as a Gif If needed
  
  # Unsupported Features:
    - Body mass and density not included in motion equations
    - GIF saving frame rate is fixed not flexible
    
 I'd be Glad to answer  your questions. I did this project a long time a go. But I didn't have the time to document and share it.
 
