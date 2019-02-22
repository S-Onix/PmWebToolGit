<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
$pink: #fe3a7d;
$orange: #ff7b0a;

body{
  display:flex;
  justify-content:center;
  align-items:center;
  height:100vh;
  background:#222;
  font-family: 'Josefin Sans';
  background:linear-gradient(45deg, $pink, $orange);
  overflow:hidden;
  max-width:100vw;
  max-height:100vh;
  &:before{
    content:'le click';
    position:absolute;
    color:#999;
    font-size:14px;
    z-index:999;
    bottom:10px;
    width:100%;
    text-align:center;
  }
  *{
    transition:all 300ms cubic-bezier(0.175, 0.885, 0.32, 1.275);
    &:before, &:after{
      transition:all 300ms cubic-bezier(0.175, 0.885, 0.32, 1.275);
      content:'';
      position:absolute;
      background:#fff;
    }
  }
  input{
    opacity:0;
    position:absolute;
    width:100vw;
    height:100vh;
    top:0;
    left:0;
    z-index:9999;
    cursor:pointer;
    &:checked ~ div{
      transition:all 300ms cubic-bezier(0.175, 0.885, 0.32, 1.275);
      padding-right:35px;
      &:before{
        transform:scale(1);
        transition-delay:0.2s;
      }
      h1{
        &:before{
          transform:scaleY(1);
          transition:all 300ms cubic-bezier(0.175, 0.885, 0.32, 1.275);
          transition-delay:0.4s;
        }
        &:after{
          box-shadow:0 77px 0 1px #222, 0 72px 0 0px $pink;
          transition:all 300ms cubic-bezier(0.175, 0.885, 0.32, 1.275);
          transform:scaleY(1) rotate(5deg);
          transition-delay:0.5s;
        }
        *{
          &:before, &:after{
            background:$pink;
          }
        }
        span{
          width:50px;
          &:last-of-type{
            color:$pink;
            transition-delay:0.25s;
          }
          &:nth-of-type(2){
            transform:translateX(-2.5px) scaleY(1);
            width:50px;
            margin:0 5px;
            &:before{
              box-shadow:0 65px 0 0 $pink;
            }
            &:before, &:after{
              transform:scaleX(1);
              transition-delay:0.2s;
            }
            &:after{
              transition-delay:0.4s;
            }
          }
          &:first-of-type{
            transform:translateY(-2px) translateX(-2.5px);
            &:before{
              transform:translateX(0);
            }
            b{
              &:before, &:after{
                transition-delay:0.175s;
              }
              &:before{
                 transform:rotate(30deg) scaleY(1);
                transition-delay:0.25s;
              }
              &:after{
                 transform:rotate(-30deg) scaleY(1);
              }
            }
          }
        }
      }
    }
  }
  div{
    position:relative;
    display:inline-block;
    padding-right:0px;
    min-width:215px;
    &:before{
      content:'';
      position:absolute;
      width:500px;
      height:500px;
      background:#222;
      border-radius:100%;
      transition:all 500ms cubic-bezier(1, 0.885, 0.32, 1);
      transform:scale(4);
      left:calc(50% - 250px);
      top:calc(50% - 250px);
    }
    h1{
      margin:0px;
      color:#fff;
      font-weight:100;
      font-size:100px;
      position:relative;
      &:after{
        width:3px;
        height:65px;
        top:10px;
        background:linear-gradient(to bottom, $orange, $pink);
        right:-20px;
        display:inline-block;
        transform:scaleY(0) rotate(5deg);
        box-shadow:0 77px 0 -5px #222, 0 72px 0 -5px $pink;
        transform-origin:bottom;
        transition:none;
      }
      &:before{
        width:137.5px;
        height:3px;
        background:linear-gradient(to right, $orange, $pink);
        bottom:15px;
        right:0px;
        transform-origin:right;
        transform:scaleX(0);
        transition:none;
      }
      span{
        display:inline-block;
        color:#000;
        position:relative;
        width:0px;
        &:last-of-type{
          width:auto;
          color:#fff;
        }
        &:first-of-type{
          transform-origin:bottom;
          transform:translateY(3px) translateX(-7.5px) scaleX(0);
          &:before{
            width:3px;
            height:30px;
            bottom:32.5px;
            left:31px;
            transform:translateX(-25px);
          }
          b{
            position:relative;
            color:transparent;
            &:before, &:after{
              height:47.5px;
              top:1px;
              width:3px;
              transform: rotate(0deg) scaleY(0);
              left:31px;
              transform-origin:0px 100%;
            }
            &:after{
              transform-origin:100% 100%;
            }
          }
        }
        &:nth-of-type(2){
          transform:translateX(-13px) scaleY(0);
          &:before, &:after{
            width:42px;
            height:3px;
            top:12px;
            left:12px;
            box-shadow:0 65px 0 0 #fff;
            transition:all 300ms cubic-bezier(0.175, 0.885, 0.32, 1.275);
            transform-origin:left;
            transform:scaleX(0);
          }
          &:after{
            box-shadow:none;
            top:45px;
            width:38px;
          }
          b{
            position:relative;
            color:transparent;
            &:before{
              width:3px;
              height:68px;
              top:5px;
              left:12px;
            }
          }
        }
      }
    }
  }
}
</style>
</head>
<body>
<input type="checkbox" />
<div>
  <h1>CS<span><b>Y</b></span><span><b>E</b></span><span>S</span></h1>
</div>
</body>
</html>