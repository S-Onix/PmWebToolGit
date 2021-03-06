<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
var vue = new Vue({
	  el: '#app',
	  data: {
	    formOpen: false,
	    productData: {
	      title: '',
	      rating: '',
	      price: '',
	      list_price: '',
	      is_featured: false
	    }
	  },
	  methods: {
	    resetForm: function () {
	      this.productData = {
	        title: '',
	        rating: '',
	        price: '',
	        list_price: '',
	        is_featured: false
	      }
	    },
	    cancel: function() {
	      this.formOpen = false;
	      this.resetForm();
	    }
	  }
	})
</script>
<style type="text/css">
.container {
  background-image: linear-gradient(-128deg, rgba(255, 181, 32, 0.93) 3%, rgba(239, 39, 153, 0.93) 88%, rgba(237, 18, 171, 0.93) 100%);
  display: flex;
  width: 100%;
  height: 100%;
  justify-content: center;
  align-items: center;
}

.add-product {
  &.open {  
    background-color: #FAFAFA;
    padding: 18px 32px;
    border-radius: 5px;
    width: 420px;
    height: 398px;
    cursor: default;
    form {
      opacity: 1;
      transition: opacity 0.1s ease;
      transition-delay: 0.3s;
      height: auto;
    }
  }
  transition: all 0.3s ease;
  background-color: #FFC145;
  height: 144px;
  width: 144px;
  border-radius: 72px;
  box-shadow: 0 4px 16px 0 rgba(0, 0, 0, .07);
  cursor: pointer;
  .button-copy {
    text-align: center;
    line-height: 144px;
    text-transform: uppercase;
    font-weight: bold;
    color: #f7f7f7;
  }
  form {
    transition: none;
    opacity: 0;
    height: 0;
    overflow: hidden;
  }
  .cancel {
    font-size: 12px;
    text-align: center;
    margin-top: 1em; 
    span {
      cursor: pointer;
      &:hover {
        text-decoration: underline;
      }
    }
  }
}

.submit-button {
  display: block;
  background-color: #3498DB;
  height: 40px;
  border-radius: 20px;
  line-height: 36px;
  text-align: center;
  color: #fff;
  text-transform: uppercase;
  font-size: 0.875em;
  border: none;
  font-weight: 700;
  padding: 0 34px;
  margin: 0 auto;
  img {
    position: relative;
    top: 3px;
    right: 6px;
  }
  &:hover {
    background-color: darken(#3498DB, 10%);
    cursor: pointer;
  }
}

.featured-note {
  color: #949494;
  font-size: 12px;
  margin: 4px 0px;
  line-height: 18px;
  font-style: italic;
}

form * {
  outline: none;
}

label {
  display: block;
  font-size: 14px;
  font-weight: bold;
  user-select: none;
  &.emoji {
    input {
      -webkit-appearance: none;
      -moz-appearance: none;
      appearance: none;
      height: 21px;
      margin: 0;
      display: none;
      &+span:after {
        content: "😶";
        font-size: 18px;
        top: 2px;
        left: 2px;
        position: relative;
        height: 18px;
        display: inline-block;
      }
      &:checked+span:after {
        content: "😀";
      }
    }
  }
}

.form--field {
  width: 420px;
  margin: 10px 0;
  &.-short {
    width: 120px;
  }
}

.form--price {
  position: absolute;
  line-height: 38px;
  width: 16px;
  color: #C7C7C7;
  text-align: center;
  & + input {
    padding-left: 14px;
  }
}

.form--container {
  width: 420px;
  &.-inline {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    margin-bottom: -12px;
  }
}

.form--element {
  background-color: #fff;
  border: 1px solid #ECECEC;
  border-radius: 3px;
  font-size: 14px;
  line-height: 28px;
  padding: 0 4px;
  color: #3D3D3D;
  width: 100%;
  margin: 4px 0;
  box-sizing: border-box;
  font-family: 'Open Sans', sans-serif;
  &:focus {
    border: 1px solid #FFC145;
    border-radius: 2px;
  }
  &:not(.texteare) {
    height: 30px;
  }
  &.textarea {
    height: 80px;
    resize: none;
  }
}


html,
body {
  height: 100%;
  margin: 0;
}

body {
  font-family: 'Open Sans', sans-serif;
  font-size: 16px;
  background-color: #F3F4F5;
  cursor: default;
}

a {
  text-decoration: none;
  cursor: pointer;
}

::selection {
  background-color: #F5617A;
  color: #fff;
}

::-moz-selection {
  background-color: #F5617A;
  color: #fff;
}
</style>
</head>
<body>
<div class="container" id="app">
  <div class="add-product" :class="{'open': formOpen}">
    <div class="button-copy" v-show="!formOpen" @click="formOpen = true">Add Product</div>
    <form @submit="cancel()">

      <div class="form--field">
        <label>Product Title *</label>
        <input type="text" class="form--element" name="title" v-model="productData.title" placeholder="Title" required="">
      </div>
      <div class="form--container -inline">
        <div class="form--field -short">
          <label>Product Rating *</label>
          <input type="number" class="form--element" name="rating" v-model="productData.rating" placeholder="Rating" required="" min="0" max="5" step="0.5">
        </div>
        <div class="form--field -short">
          <label>Product Price *</label>
          <span class="form--price">$</span>
          <input type="text" class="form--element" name="price" v-model="productData.price" placeholder="Price" required="" min="0" max="500" pattern="\d+(\.\d{2})?">
        </div>
        <div class="form--field -short">
          <label>List Price *</label>
          <span class="form--price">$</span>
          <input type="text" class="form--element" name="list_price" v-model="productData.list_price" placeholder="List Price" required="" min="0" max="500" pattern="\d+(\.\d{2})?">
        </div>
      </div>
      <div class="form--field">
        <label class="emoji">
          Is Featured
          <input type="checkbox" name="is_featured" v-bind="productData.is_featured">
          <span></span>
        </label>
        <p class="featured-note">If Is Featured is selected the product will appear in a large card.</p>
      </div>
      <div class="form--field">
        <label>Product Description</label>
        <textarea class="form--element textarea" v-model="productData.description" placeholder="Description">                                
        </textarea>
      </div>

      <button type="submit" class="submit-button">Add Product</button>
      <div class="cancel"><span @click="cancel()">Cancel</span></div>
    </form>
  </div>
</div>
</body>
</html>