/* global Vue, $ */
document.addEventListener("DOMContentLoaded", function(event) {
  var app = new Vue({
    el: ".articles",
    data: {
      articles: [],
      newArticleTitle: "",
      newArticleAuthor: "",
      newArticleImage: "",
      newArticleDate: "",
      newArticleDescription: "",
      titleFilter: "",
      authorFilter: "",
      sortAscending: true
    },
    computed: {
      filteredArticle: function() {
        var lowerTitleFilter = this.titleFilter.toLowerCase();
        var lowerAuthorFilter = this.authorFilter.toLowerCase();
        var filtered = this.articles.filter(function(article) {
          var lowerTitle = article.title.toLowerCase();
          var lowerAuthor = article.author.toLowerCase();
          return lowerTitle.indexOf(lowerTitleFilter) !== -1 && lowerAuthor.indexOf(lowerAuthorFilter) !== -1;
        });
        var sorted = filtered.sort(function(article1, article2) {
          if (this.sortAscending) {
            return article1[this.sortAttribute] > article2[this.sortAttribute];
          } else {
            return article1[this.sortAttribute] < article2[this.sortAttribute];
          }
        }.bind(this));
        return filtered;
      }
    },
    mounted: function() {
      $.get("api/v1/articles", function(responseData) {
        this.articles = responseData;
      }.bind(this));
    },
    methods: {
      setSortAttribute: function(inputAttribute) {
        if (inputAttribute === this.sortAttribute) {
          this.sortAscending = !this.sortAscending;
        } else {
          this.sortAscending = true;
        }
        this.sortAttribute = inputAttribute;
      },
      addArticle: function() {
        var params = {
          title: this.newArticleTitle,
          author: this.newArticleAuthor,
          image: this.newArticleImage,
          date: this.newArticleDate,
          description: this.newArticleDescription
        };
        $.post("/api/v1/articles", params, function(responseData) {
          this.articles.push(responseData);
          this.newArticleTitle = "";
          this.newArticleAuthor = "";
          this.newArticleImage = "";
          this.newArticleDate = "";
          this.newArticleDescription = "";
        }.bind(this));
      }
    }
  });
});
