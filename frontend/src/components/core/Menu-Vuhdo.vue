<template>
  <div id="search-vuhdo">
    <md-layout md-row class="addon-name nowrap">
      <div class="grow">
        <md-layout md-row>
          <md-avatar class='square'><category-image :group="'t-vuhdo'"></category-image></md-avatar>
          <h2 id="addon-name">VuhDo</h2>
        </md-layout>
        <addon-info addon="vuhdo"></addon-info>
      </div>
    </md-layout>
    <md-layout>
      <md-layout v-for="(classes, index) in aClasses" v-bind:key="index">
        <md-subheader v-if="!index">{{ $t("Classes") }}</md-subheader>
        <md-subheader v-else></md-subheader>
        <md-list class="md-double-line md-dense">
          <md-list-item v-for="cls in classes" v-bind:key="cls.id" :class="cls.id + ' md-inset'">
            <div class="menu-image"></div>
            <div class="md-list-text-container">
              <router-link :to="'/vuhdo/' + cls.slug">{{ cls.text }}</router-link>
              <span>
                <router-link  v-for="spec in cls.specs" v-bind:key="spec.id" :to="'/vuhdo/' + spec.slug">{{ spec.text.replace(cls.text, '').trim() }}</router-link>
              </span>
            </div>
          </md-list-item>
        </md-list>
      </md-layout>
      <md-layout>
        <md-subheader>Vuhdo</md-subheader>
        <md-list class="md-double-line md-dense">
          <md-list-item class="md-inset vuhdo1">
            <div class="menu-image"></div>
            <div class="md-list-text-container">
              <router-link to="/vuhdo">Vuhdo</router-link>
              <span>
                <a v-for="(item, index) in vuhdo" :href="'/vuhdo/' + item.slug" @click.prevent="searchRoute(item)" v-bind:key="index">{{ item.text }}</a>
              </span>
            </div>
          </md-list-item>
        </md-list>

        <md-subheader>{{ $t("Class Roles") }}</md-subheader>
        <md-list class="md-double-line md-dense">

          <md-list-item class="md-inset role0">
            <div class="menu-image"></div>
            <div class="md-list-text-container">
              <router-link to="/vuhdo/roles">{{ $t("Class Roles") }}</router-link>
              <span>
                <router-link v-for="(item, index) in roles" :to="'/vuhdo/' + item.slug" v-bind:key="index">{{ item.text }}</router-link>
              </span>
            </div>
          </md-list-item>
        </md-list>
      </md-layout>
    </md-layout>
  </div>
</template>

<script>
import CategoryImage from '../UI/CategoryImage.vue'
import AddonInfoBox from '../UI/AddonInfoBox.vue'
export default {
  components: {
    'category-image': CategoryImage,
    'addon-info': AddonInfoBox
  },
  methods: {
    runSearch: function () {
      this.$router.push('/search/' + this.searchString.trim().replace(/\s+/g, '+'))
    },
    searchRoute: function (item) {
      this.$store.commit('userSearchOption', {field: 'expansion', value: 'sl'})
      if (typeof item === 'string') {
        item = window.Categories.match(item)
      }
      this.$store.commit('setSearchText', `type:VUHDO category:${item.id}`)
      this.$router.push('/vuhdo/' + item.slug)
    }
  },
  data: function () {
    return {
      searchString: 'Type: VuhDo '
    }
  },
  computed: {
    aClasses: function () {
      const cats = window.Categories.classCategories()
      const n = cats.length / 3
      return [[...cats.splice(0, Math.ceil(n))], [...cats.splice(0, Math.round(n))], [...cats]]
    },
    roles: function () {
      return window.Categories.getCategories(['role4', 'role1', 'role2', 'role3'])
    },
    vuhdo: function () {
      return window.Categories.getCategories(['vuhdo1', 'vuhdo2', 'vuhdo3'])
    }
  },
  mounted: function () {
    this.$store.commit('setPageInfo', {
      title: 'Vuhdo',
      description: this.$t('Browse Vudho imports')
    })
    this.http.get('/search/menu', {view: 'Vuhdo'})
  }
}
</script>


<style lang="scss">
.addon-name {
  .md-avatar {margin: 16px; border-radius: 4px;}
  h2 {margin: 16px 0 0 0; line-height: 40px}
}
h2 .faded {opacity: .3}
h2 span {font-size:80%; cursor: pointer}
#searchForm { padding: 16px; flex: 1 }
#searchForm button { margin-top: -3px }

#addon-name .md-theme-default.md-switch {margin: 0 8px; zoom:0.8}
#addon-name .md-theme-default.md-switch.md-checked .md-switch-container {background-color: rgba(0, 0, 0, 0.38);}
#addon-name .md-theme-default.md-switch.md-checked .md-switch-thumb {background-color: #fafafa;}

#search-vuhdo .md-list-item img { height: 48px; padding-right: 16px; vertical-align:top}
#search-vuhdo a { margin-right: 12px }
#search-vuhdo .md-list-item.md-inset .md-list-item-container { padding-left: 24px; flex-wrap: wrap; padding-bottom: 16px }
#search-vuhdo .md-list-text-container a { white-space: nowrap; display: inline-block }
#search-vuhdo .md-list-text-container > a, #search-vuhdo .md-list-text-container > .parent-category { font-size: 18px; font-weight: bold; line-height: 19px; }
#search-vuhdo .md-list-text-container span{ white-space: normal; line-height: 22px}
#search-vuhdo .md-layout { align-items: flex-start}

#search-vuhdo .md-subheader { width: 100% }
#search-vuhdo .md-subheader + .md-list { width: 100% }
.md-list:after { background-color: transparent!important }
</style>

