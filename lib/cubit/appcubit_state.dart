class Shopstates {}

class intialState extends Shopstates {}

class OntapOfbottomnavigatorbarState extends Shopstates {}

class GetProductState extends Shopstates {}
class numberState extends Shopstates {}

class lodingProductState extends Shopstates {}

class GetProductErrorState extends Shopstates {
  final String error;

  GetProductErrorState(this.error);
}

class GetCatigoriesState extends Shopstates {}

class GetCatigoriesErrorState extends Shopstates {}

class GetCatigoriesLodingState extends Shopstates {}

class CahngeFAvetsuccessState extends Shopstates {}

class CahngeFAvetErrorState extends Shopstates {}

class CahngeCarttsuccessState extends Shopstates {}

class CahngeCartErrorState extends Shopstates {}

class lodingFavoritsProducts extends Shopstates {}

class GitFAvetsuccessState extends Shopstates {}

class GitFAvetErrorState extends Shopstates {}
class lodingCartProducts extends Shopstates {}

class GitCartuccessState extends Shopstates {}

class GitCartErrorState extends Shopstates {}

class GitProductsOfCatigorystate extends Shopstates {}

class GitProductsOfCatigoryError extends Shopstates {}

class lODINGGitProductsOfCatigorystate extends Shopstates {}
