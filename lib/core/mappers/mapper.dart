abstract class Mapper<I, O> {
  const Mapper();

  O mapFromModel(I entity);

  I mapToModel(O model);
}